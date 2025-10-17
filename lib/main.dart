import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'splashscreen.dart';
import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(); // Initialize Firebase
    print('Firebase initialized successfully at ${DateTime.now()}'); // Log success
  } catch (e) {
    print('Firebase initialization error at ${DateTime.now()}: $e'); // Log error
    // Optionally, you can rethrow or handle this (e.g., show an error screen)
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZEO Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Preserve state during hot reload

  Widget? _lastBuiltWidget; // Cache the last built widget
  User? _cachedUser;

  @override
  void initState() {
    super.initState();
    // Cache initial auth state
    _cachedUser = FirebaseAuth.instance.currentUser;
    print('Initial auth state cached at ${DateTime.now()}: $_cachedUser'); // Debug log
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // During hot reload, try to preserve the last state
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If we have a cached user or last widget, preserve it
          if (_cachedUser != null || _lastBuiltWidget != null) {
            print('Using cached widget/state at ${DateTime.now()}: $_lastBuiltWidget');
            return _lastBuiltWidget ?? const HomeScreen();
          }
          print('Showing loading spinner at ${DateTime.now()}');
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          _cachedUser = snapshot.data;
          _lastBuiltWidget = const HomeScreen();
          print('User logged in at ${DateTime.now()}: $_cachedUser, navigating to HomeScreen');
          return const HomeScreen();
        }

        // Clear cache when no user
        _cachedUser = null;
        _lastBuiltWidget = const Splashscreen();
        print('No user at ${DateTime.now()}, navigating to Splashscreen');
        return const Splashscreen();
      },
    );
  }
}