// lib/barcode_scanner_page.dart
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String? scannedCode;
  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera View
          MobileScanner(
            onDetect: (capture) {
              if (isScanned) return;
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                setState(() {
                  isScanned = true;
                  scannedCode = barcode.rawValue;
                });
                Navigator.pop(context, scannedCode); // send back result
              }
            },
          ),

          // Close button (top-left)
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.white, size: 40),
            ),
          ),

          // Scan frame overlay (center)
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          // Bottom bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF1C2230),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Stops Added 0",
                    style: TextStyle(color: Colors.white70),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, scannedCode),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text("Done adding stops"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
