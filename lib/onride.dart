import 'package:flutter/material.dart';

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
                          hintText: 'Search Route by name, stops and more...',
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
                  _buildOptionButton('by Address',Icons.search),
                  _buildOptionButton('On Map',Icons.location_city),
                  _buildOptionButton('By Lat Long',Icons.location_on_outlined),
                ],
              ),
              const SizedBox(height: 30),
              // Text: Create your first route
              Center(
                child: const Text(
                  'Create your first route!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Search by address and add your delivery/ pickup stops to create your first route',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              // Placeholder for additional content
              const SizedBox(height: 100), // Adjust height as needed
              // Three icons at the bottom left
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    // Placeholder for first custom icon
                    const Icon(Icons.home, color: Colors.white, size: 30),
                    const SizedBox(width: 15),
                    // Placeholder for second custom icon
                    const Icon(Icons.settings, color: Colors.white, size: 30),
                    const SizedBox(width: 15),
                    // Placeholder for third custom icon
                    const Icon(Icons.person, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text, IconData icon) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for optional leading icon (replace with your icon)
            const SizedBox.shrink(), // Default empty space, replace with Icon if needed
            const SizedBox(width: 5), // Space between icon and text
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}