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
              height: 170,
              width: 500,
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF007BFF),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Hello!',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(width: 220,),
                          CircleAvatar(child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.edit),
                          )),
                          SizedBox(width: 20,),
                          CircleAvatar(child: Icon(Icons.notifications))                   
                        ],
                      ),
                      const Text(
                        'xyz@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 60,
                        width: 450,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12,),
                          color: Color.fromARGB(255, 23, 120, 199),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.star, color: Colors.orange, size: 30,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("What's new...", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, bottom: 4.0),
                                  child: Text("Introducing buffer time- Now you can add..."),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Column(
                            children: [
                              Text('0', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20,)),
                              Text('Trips Completed', style: TextStyle(color: Colors.white, fontSize: 14)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('0 kms', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20)),
                              Text('Travel Reduced', style: TextStyle(color: Colors.white, fontSize: 14)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('₹0', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20)),
                              Text('Saved on expenses', style: TextStyle(color: Colors.white, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black45,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(child: Icon(Icons.upgrade, color: Colors.white,), backgroundColor: Colors.orange,),
                                  ),
                                  const Text('Upgrade to PREMIUM', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Manage', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: Colors.black,),
                        padding: const EdgeInsets.all(26.0),
                        child: GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.logout, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Logout', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        
                      ),
                      SizedBox(height: 20,),
                      Center(child: Text('App version 27.6',style: TextStyle(color: Colors.blueGrey),)),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Terms & conditions',style: TextStyle(color: Colors.blue),),
                          SizedBox(width: 20,),
                          Text('Privacy Policy',style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      SizedBox(height: 20,),
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

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color(0xFF007BFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 25),
        ),
        const SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}