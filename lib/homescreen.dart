import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'history.dart';
import 'support.dart';
import 'onride.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  
  int _selectedIndex = 0;
  User? _currentUser;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _currentUser = FirebaseAuth.instance.currentUser;
    
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          _currentUser = user;
        });
        // If user logs out, AuthGate will handle navigation back to splash
        if (user == null) {
          // Optional: Show logout message
        }
      }
    });

    _restoreNavigationState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _restoreNavigationState() async {
    // Implement SharedPreferences if needed
  }

  Future<void> _saveNavigationState() async {
    // Implement SharedPreferences if needed
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _saveNavigationState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    // If no user, return loading or error state
    if (_currentUser == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    final List<Widget> _pages = [
      const HistoryScreen(),
      const HelpSupportScreen(),
      const OnRideScreen(),
      MyProfileScreen(user: _currentUser), // Pass user data to profile
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2526),
        automaticallyImplyLeading: false,
        title: _selectedIndex == 0 
            ? const Text(
                'History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            : null,
        actions: _selectedIndex == 0
            ? [
                const Icon(Icons.calendar_today, color: Colors.white),
                const SizedBox(width: 16),
              ]
            : null,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E90FF),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF1C2526),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bike), label: 'On Ride'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Profile'),
        ],
      ),
    );
  }
}