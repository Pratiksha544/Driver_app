import 'package:demo/barcode_scanner.dart';
import 'package:demo/image_upload.dart';
import 'package:demo/import.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ✅ Function to open YouTube link
Future<void> _launchYouTube() async {
  final Uri url = Uri.parse('https://www.youtube.com/'); // Change link if needed
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

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
              Container(height: 250, color: const Color(0xFF1C2526)),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  const SearchResultsPage(),
                              transitionsBuilder:
                                  (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, -1.0);
                                const end = Offset.zero;
                                final tween = Tween(begin: begin, end: end);
                                final offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Search by address',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.mic, color: Colors.blue, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOptionButton(context, Icons.search, 'by Address'),
                  const SizedBox(width: 10),
                  _buildOptionButton(
                      context, Icons.location_on_outlined, 'On Map'),
                  const SizedBox(width: 10),
                  _buildOptionButton(context, EvaIcons.globe, 'By lat long'),
                ],
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Create your first route!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Center(
                  child: Text(
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
              Center(
                child: SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    onPressed: _launchYouTube, // ✅ Opens YouTube
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_call, color: Colors.blue, size: 18),
                        SizedBox(width: 5),
                        Text(
                          'watch help videos',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Padding(
  padding: const EdgeInsets.only(bottom: 16.0),
  child: Row(
    children: [
      // ✅ SIM card icon — now clickable
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImportPage()),
          );
        },
        child: const Icon(Icons.sim_card_alert, color: Colors.blue, size: 30),
      ),
      const SizedBox(width: 15),

      // 🖼️ Photo icon — you can make it clickable too if you want
      GestureDetector(
        onTap: () {
          // Example: Navigate to image upload page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilePickerUIPage()),
          );
        },
        child: const Icon(Icons.photo, color: Colors.blue, size: 30),
      ),
      const SizedBox(width: 15),

      // 🔳 QR Code icon — also can be made clickable
      GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BarcodeScannerPage()),
          );
          if (result != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Scanned: $result')),
            );
          }
        },
        child:
            const Icon(Icons.qr_code_scanner_sharp, color: Colors.blue, size: 30),
      ),
    ],
  ),
),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, IconData icon, String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          if (text == 'by Address' || text == 'By lat long') {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SearchResultsPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, -1.0);
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
          }
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              Container(height: 60),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2F32),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Search by address',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.mic, color: Colors.blue, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOption(context, Icons.search, 'by search'),
                  const SizedBox(width: 10),
                  _buildOption(context, Icons.location_on, 'on map'),
                  const SizedBox(width: 10),
                  _buildOption(context, EvaIcons.globe, 'by lat long'),
                ],
              ),
              const SizedBox(height: 20),

              // ✅ Import Excel
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ImportPage()),
                  );
                },
                child: _buildFeatureTile(
                  icon: Icons.sim_card_alert,
                  title: 'Import excel',
                  description:
                      'Import your stops as a convenient\nexcel or csv sheet',
                  imagePath: 'images/sim.png',
                ),
              ),
              const SizedBox(height: 20),

              // ✅ Image Upload
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilePickerUIPage()),
                  );
                },
                child: _buildFeatureTile(
                  icon: Icons.image,
                  title: 'Image upload',
                  description:
                      'Upload your stops as an image or\ncapture it as a photo',
                  imagePath: 'images/pic.png',
                ),
              ),
              const SizedBox(height: 20),

              // ✅ Barcode Scanner
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodeScannerPage()),
                  );
                  if (result != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Scanned: $result')),
                    );
                  }
                },
                child: _buildFeatureTile(
                  icon: Icons.qr_code_scanner,
                  title: 'Scan Barcode',
                  description:
                      'Add stops by simply scanning the\nbarcode of your stops',
                  imagePath: 'images/barcode.png',
                ),
              ),
              const SizedBox(height: 60),

              const Center(
                child: Text(
                  'Want to learn more...watch our help video',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    onPressed: _launchYouTube, // ✅ Opens YouTube
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_call, color: Colors.blue, size: 22),
                        SizedBox(width: 5),
                        Text(
                          'watch help videos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120),

              Row(
                children: [
                  Padding(
  padding: const EdgeInsets.only(bottom: 16.0),
  child: Row(
    children: [
      // ✅ SIM card icon — now clickable
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImportPage()),
          );
        },
        child: const Icon(Icons.sim_card_alert, color: Colors.blue, size: 30),
      ),
      const SizedBox(width: 15),

      // 🖼️ Photo icon — you can make it clickable too if you want
      GestureDetector(
        onTap: () {
          // Example: Navigate to image upload page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilePickerUIPage()),
          );
        },
        child: const Icon(Icons.photo, color: Colors.blue, size: 30),
      ),
      const SizedBox(width: 15),

      // 🔳 QR Code icon — also can be made clickable
      GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BarcodeScannerPage()),
          );
          if (result != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Scanned: $result')),
            );
          }
        },
        child:
            const Icon(Icons.qr_code_scanner_sharp, color: Colors.blue, size: 30),
      ),
    ],
  ),
),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Done adding stops',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
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

  Widget _buildOption(BuildContext context, IconData icon, String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(icon, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
