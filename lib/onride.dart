import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class OnRideScreen extends StatelessWidget {
  const OnRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2526),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Added Container with height 250
              Container(
                height: 250,
                color: const Color(0xFF1C2526), // Matches background to avoid visual break
              ),
              // Search bar with microphone
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2F32),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    // Placeholder for left icon (replace with your icon)
                    const Icon(Icons.search, color: Colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search by address',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // Placeholder for right icon (replace with your icon)
                    const Icon(Icons.mic, color: Colors.grey, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Row with Search by Address, On Map, By Lat Long
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOptionButton(Icons.search,'by Address'),
                  SizedBox(width: 10,),
                  _buildOptionButton(Icons.location_on_outlined,'On Map'),
                  SizedBox(width: 10,),
                  _buildOptionButton(EvaIcons.globe,'By lat long'),
                ],
              ),
              const SizedBox(height: 30),
              // Text: Create your first route
              Center(
                child: const Text(
                  'Create your first route!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Center(
                  child: const Text(
                    'Search by address and add your delivery/\npickup stops to create your first route',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Outlined button: Watch Help Videos
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Watch Help Videos',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  
                ),
              ),
              const SizedBox(height: 80), // Adjust height as needed
              // Three icons at the bottom left
              Padding(
                padding: const EdgeInsets.only( bottom: 16.0),
                child: Row(
                  children: [
                    // Placeholder for first custom icon
                    const Icon(Icons.sim_card_alert, color: Colors.blue, size: 30),
                    const SizedBox(width: 15),
                    // Placeholder for second custom icon
                    const Icon(Icons.photo, color: Colors.blue, size: 30),
                    const SizedBox(width: 15),
                    // Placeholder for third custom icon
                    const Icon(Icons.qr_code_scanner_sharp, color: Colors.blue, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(IconData icon,String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side:  BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          padding:  EdgeInsets.symmetric(vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),   // Default empty space, replace with Icon if needed
            const SizedBox(width: 5), // Space between icon and text
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}