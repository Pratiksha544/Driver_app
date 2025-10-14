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
                    // Placeholder for left icon
                    const Icon(Icons.search, color: Colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const SearchResultsPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, -1.0); // Start from top
                                const end = Offset.zero;
                                final tween = Tween(begin: begin, end: end);
                                final offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: const Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: TextField(
                          enabled: false, // Disable default keyboard to handle tap manually
                          decoration: const InputDecoration(
                            hintText: 'Search by address',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    // Placeholder for right icon
                    const Icon(Icons.mic, color: Colors.grey, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Row with Search by Address, On Map, By Lat Long
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOptionButton(Icons.search, 'by Address'),
                  SizedBox(width: 10,),
                  _buildOptionButton(Icons.location_on_outlined, 'On Map'),
                  SizedBox(width: 10,),
                  _buildOptionButton(EvaIcons.globe, 'By lat long'),
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
                child: SizedBox(
                  width: 200, // Limits the width of the button and its outline
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Changed curve to 15-pixel radius
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_arrow, color: Colors.blue, size: 18), // Added icon to the left
                        const SizedBox(width: 5), // Spacing between icon and text
                        const Text(
                          'watch help videos',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80), // Adjust height as needed
              // Three icons at the bottom left
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
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

  Widget _buildOptionButton(IconData icon, String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 5),
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

// Updated Search Results Page to match the second image
class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

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
              Container(height: 60,),
              // Search bar at the top
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2F32),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Search by address',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.mic, color: Colors.grey, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Row with three options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOption(Icons.search, 'by search'),
                  SizedBox(width: 10,),
                  _buildOption(Icons.location_on, 'on map'),
                  SizedBox(width: 10,),
                  _buildOption(EvaIcons.globe, 'by lat long'),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              // Column with three options
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10), // Adds curve with a 10-pixel radius
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(child: Icon(Icons.sim_card_alert_sharp, color: Colors.blue)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Import Excel', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('Import your stops as convenient excel\nor csv sheet',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Column with three options
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10), // Adds curve with a 10-pixel radius
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(child: Icon(Icons.image, color: Colors.blue)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Image upload', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('Upload your stops as an image or\ncapture it as a photo',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Column with three options
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10), // Adds curve with a 10-pixel radius
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(child: Icon(Icons.barcode_reader, color: Colors.blue)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Scan Barcode', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('Add stops by simple scanning the\nbarcode of your stops',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 60,),
              Center(child: Text('Want to learn more...watch our help video', style: TextStyle(fontSize: 16, color: Colors.grey),)),
              SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  width: 200, // Limits the width of the button and its outline
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Changed curve to 15-pixel radius
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      
                    ),                 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.video_call, color: Colors.blue, size: 22), // Added icon to the left
                        const SizedBox(width: 5), // Spacing between icon and text
                        const Text(
                          'watch help videos',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
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
                  Spacer(),
                  ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Sets the button background to blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Adds a 10-pixel curve
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Optional padding for better appearance
                      ),
                      child: const Text(
                        'Done adding stops',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 5),
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