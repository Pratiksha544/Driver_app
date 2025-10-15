
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'splashscreenpage1.dart';
import 'splashscreenpage2.dart';
import 'splashscreenpage3.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRoundedContainer({
    Widget? child,
    double? width,
    double? height,
    EdgeInsets? margin = const EdgeInsets.symmetric(horizontal: 60),
    double borderRadius = 5,
  }) {
    return Container(
      width: width ?? 500,
      height: height ?? 70,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }

  Widget _buildOptionRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
          const Icon(Icons.check, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildBlueButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 110, 221),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(child: Text('Mark stop as done', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }

  Widget _buildPageIndicators() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == _currentPage ? 24 : 8,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      // ignore: avoid_print
      print('Starting Google Sign-In...');
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // ignore: avoid_print
        print('Google Sign-In aborted by user');
        return;
      }

      // ignore: avoid_print
      print('Google user selected: ${googleUser.email}');
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // ignore: avoid_print
      print('Access Token: ${googleAuth.accessToken}');
      // ignore: avoid_print
      print('ID Token: ${googleAuth.idToken}');

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      // ignore: avoid_print
      print('Firebase user: ${user?.email}, UID: ${user?.uid}, Is Email Verified: ${user?.emailVerified}');

      if (user != null) {
        await Future.delayed(const Duration(milliseconds: 500)); // Ensure auth state propagates
        // ignore: avoid_print
        print('Auth successful, navigation handled by AuthGate');
      } else {
        // ignore: avoid_print
        print('No user after auth');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Authentication failed: No user found.')),
          );
        }
      }
    } on FirebaseAuthException catch (e, stackTrace) {
      // ignore: avoid_print
      print('Firebase Auth error: ${e.code} - ${e.message} - Stack: $stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Auth error: ${e.message ?? e.code}')),
        );
      }
    } catch (e, stackTrace) {
      // ignore: avoid_print
      print('General Sign-In error: $e - Stack: $stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-In failed. Check console for details.')),
        );
      }
    }
  }

  Widget _buildBottomContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF121212),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 190),
            child: Row(
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ZEO',
                  style: TextStyle(color: Color.fromARGB(255, 20, 104, 230), fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.only(left: 1, right: 140),
            child: Text(
              'Select an option to proceed...',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 40),
            label: const Text('Continue with Google', style: TextStyle(color: Colors.red, fontSize: 19)),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              side: const BorderSide(color: Colors.red, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: _signInWithGoogle,
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              side: const BorderSide(color: Colors.blue, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {},
            child: const Text('Continue with Email + Password', style: TextStyle(color: Colors.blue, fontSize: 19)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageView(
            controller: _controller,
            children: [
              buildPage1(buildRoundedContainer: _buildRoundedContainer),
              buildPage2(
                buildRoundedContainer: _buildRoundedContainer,
                buildOptionRow: _buildOptionRow,
                buildBlueButton: _buildBlueButton,
              ),
              buildPage3(buildRoundedContainer: _buildRoundedContainer),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPageIndicators(),
                const SizedBox(height: 16),
                _buildBottomContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}