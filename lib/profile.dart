import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyProfileScreen extends StatefulWidget {
  final User? user; // Make it nullable
  
  const MyProfileScreen({super.key, this.user});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  User? _currentUser;
  String _displayName = 'User';
  String _email = 'Loading...';
  String _photoUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
    
    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          _currentUser = user;
        });
        if (user != null) {
          _loadUserData();
        }
      }
    });
  }

  Future<void> _loadUserData() async {
    // Use constructor parameter first, then fallback to Firebase
    User? user = widget.user ?? FirebaseAuth.instance.currentUser;
    
    if (user != null && mounted) {
      setState(() {
        _currentUser = user;
        _email = user.email ?? 'No email';
        // Extract only the first name from displayName or email's local part
        _displayName = user.displayName?.split(' ').firstWhere((part) => part.isNotEmpty, orElse: () => 'User') ??
                      (user.email?.split('@')[0].split(' ').firstWhere((part) => part.isNotEmpty, orElse: () => 'User') ?? 'User');
        _photoUrl = user.photoURL ?? '';
      });
    }
  }

  Future<void> _handleLogout() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();

      Navigator.of(context).pop();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged out successfully')),
        );
      }
    } catch (e) {
      Navigator.of(context).pop();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(      
      body: Container(
        color: const Color(0xFF1C2526),
        child: Column(
          children: [
            // Header with user info
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF007BFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User profile picture, name, and email in a structured row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30, // Increased for visibility
                        backgroundImage: _photoUrl.isNotEmpty
                            ? NetworkImage(_photoUrl)
                            : null,
                        child: _photoUrl.isEmpty
                            ? const Icon(Icons.person, size: 40, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 20), // Increased spacing
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Hello, ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18, // Increased font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _displayName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18, // Increased font size
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis, // Prevent overflow errors
                              ),
                            ],
                          ),
                          const SizedBox(height: 8), // Increased spacing
                          // Make email scrollable horizontally if it exceeds 20 characters
                          SizedBox(
                            height: 20, // Fixed height to contain the scroll
                            width: 200, // Set a reasonable width
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                _email,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 18, // Adjusted size to ensure fit
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white, size: 18), // Adjusted size
                          onPressed: _editProfile,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjusted spacing
                      CircleAvatar(
                        radius: 18, // Adjusted size to ensure fit
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: const Icon(Icons.notifications, color: Colors.white, size: 18), // Adjusted size
                      ),
                    ],
                  ),
                    ],
                  ),
                  const SizedBox(height: 20), // Increased spacing
                  // Action icons row
                 // Increased spacing
                  // What's new card
                  Container(
                    height: 70, // Increased height
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Slightly larger radius
                      color: const Color.fromARGB(255, 23, 120, 199),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 30),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("What's new...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16)), // Increased font size
                                Text(
                                    "Introducing buffer time...",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 116, 183, 238),
                                        fontSize: 14), // Increased font size
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      // Stats row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatCard('0', 'Trips Completed'),
                          _buildStatCard('0 kms', 'Travel Reduced'),
                          _buildStatCard('₹0', 'Saved on expenses'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Single Premium Upgrade Card
                      Container(
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black45,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      child: Icon(Icons.upgrade, color: Colors.white, size: 18),
                                    ),
                                  ),
                                  Text('Upgrade to PREMIUM',
                                      style: TextStyle(fontSize: 14, color: Colors.white)),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Manage',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Grid items
                      _buildGridItems(),
                      const SizedBox(height: 15),
                      // Logout button
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: _currentUser != null ? _handleLogout : null,
                          icon: const Icon(Icons.logout, size: 18),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: const Text('Logout', style: TextStyle(fontSize: 14)),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Footer
                      const Center(
                          child: Text('App version 27.6',
                              style: TextStyle(color: Colors.blueGrey, fontSize: 12))),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildFooterLink('Terms & conditions'),
                          const SizedBox(width: 15),
                          _buildFooterLink('Privacy Policy'),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 22)),
        Text(label,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildGridItems() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black),
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8,
        children: [
          _buildGridItem(Icons.settings, 'Preferences'),
          _buildGridItem(Icons.book, 'Address Book'),
          _buildGridItem(Icons.receipt, 'Transactions'),
          _buildGridItem(Icons.monetization_on, 'Earn with Zeo'),
          _buildGridItem(Icons.track_changes, 'Tracking'),
          _buildGridItem(Icons.message, 'Messages'),
          _buildGridItem(Icons.download, 'Downloads'),
          _buildGridItem(Icons.account_circle, 'Account'),
          _buildGridItem(Icons.people, 'Connections'),
          _buildGridItem(Icons.star, 'Rate Us'),
          _buildGridItem(Icons.share, 'Share App'),
          _buildGridItem(Icons.description, 'Reports'),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return InkWell(
      onTap: () => _handleGridItemTap(label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF007BFF),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 6),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return GestureDetector(
      onTap: () => launchURL('https://yourwebsite.com/$text'),
      child: Text(text, style: const TextStyle(color: Colors.blue, fontSize: 12)),
    );
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Text('Profile editing functionality coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleGridItemTap(String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$item tapped')),
    );
  }

  void launchURL(String url) {
    print('Launching: $url');
  }
}