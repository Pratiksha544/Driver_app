import 'package:demo/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient for enhanced visibility
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1C2526), // Dark top color matching your original background
                  Color(0xFF0A0E0F), // Slightly lighter bottom color for depth
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 240),
                    // Close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Import Stops',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.white, size: 24),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Browse files on phone
                    GestureDetector(
                      onTap: () async {
                        final result = await FileService.pickFile(context: context);
                        if (result != null) {
                          // Handle the picked file (e.g., parse stops, show success dialog)
                          _handlePickedFile(context, result.files.first);
                        }
                      },
                      child: Container(
                        height: 160,
                        width: 380,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 174, 210, 231),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                          children: [
                            const Icon(Icons.file_upload, color: Color.fromARGB(255, 3, 83, 120), size: 28),
                            const SizedBox(width: 12),
                            const Text(
                              'Browse files on your phone to upload',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 3, 83, 120), fontSize: 16),
                              textAlign: TextAlign.center, // Center the text horizontally
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Download Sample Template
                    Center(
                      child: Text(
                        'Download Sample Template',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // OR divider
                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Import through URL
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2F32),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Import through URL',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Paste your google sheet URL to import, make sure the sheet have correct format',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Paste link here',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              fillColor: const Color(0xFF3A3F42),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Upload Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Upload',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to handle picked file (e.g., parse and add stops)
  void _handlePickedFile(BuildContext context, PlatformFile file) {
    // Example: Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('File Picked'),
        content: Text('File: ${file.name}\nSize: ${file.size} bytes'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    // TODO: Parse Excel/CSV (add 'excel' package if needed) and add stops to your route
    // e.g., if (file.extension == 'xlsx') { parseExcel(file); }
  }
}