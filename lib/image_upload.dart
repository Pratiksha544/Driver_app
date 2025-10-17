import 'package:flutter/material.dart';

class FilePickerUIPage extends StatelessWidget {
  const FilePickerUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10131A),
      body: Column(
        children: [
          // Spacer pushes everything down
          const Spacer(),

          // Upgrade Banner (now above the welcome card)
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
            color: Colors.amber[700],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Upgrade to unlock more uploads,\nfree plan exhausted",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ],
            ),
          ),

          // Welcome bottom card
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1C2230),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment:Alignment.centerLeft,
                  child: const Text(
                    "Hi, Welcome to ZEO",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: const Text(
                      "You have used up your one free premium route,\nUpgrade now to use our Premium Features",
                      style: TextStyle(fontSize: 14,color: Colors.white70),
                     
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Premium Features",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "● Routes with unlimited stops\n● Address upload through image scanning",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: () {
                    // Upgrade action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 33, 100, 171),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 👈 adjust this value
                    ),
                  ),
                  child: const Text("EXPLORE PREMIUM PLANS",style: TextStyle(color: Colors.white),),
                )

                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}
