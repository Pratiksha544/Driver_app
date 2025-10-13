import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: const Color(0xFF1C2526),
        child: Column(
          children: [
              Container(
              height: 150,
              width: 500,
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF007BFF),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                       Row(
                         children: [
                           Text(
                            'Hello!',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(width: 220,),
                            CircleAvatar(child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.edit),
                            ))  ,
                            SizedBox(width: 20,),
                            CircleAvatar(child: Icon(Icons.notifications))                   
                         ],
                       ),
                      Text(
                        'xyz@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('0 Trips Completed', style: TextStyle(color: Colors.white)),
                  Text('0 kms Travel Reduced', style: TextStyle(color: Colors.white)),
                  Text('₹0 Saved on expenses', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Upgrade to PREMIUM', style: TextStyle(color: Colors.black)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Manage', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}