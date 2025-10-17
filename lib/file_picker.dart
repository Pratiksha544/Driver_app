import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class FileService {
  // Pick file and request permission (file_picker handles native permissions)
  static Future<FilePickerResult?> pickFile({
    BuildContext? context,
    List<String>? allowedExtensions, // No filter, kept for future flexibility
  }) async {
    try {
      // Show dialog for permission/user confirmation if needed
      if (context != null) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Drive Access Permission'),
              content: const Text('This app needs access to your files (including Google Drive) to import. Allow access?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false), // Deny: Stay on current page
                  child: const Text('Deny'),
                ),
                TextButton(
                  onPressed: () async {
                    // On "Allow", open file picker with full access
                    Navigator.pop(context, true);
                  },
                  child: const Text('Allow'),
                ),
              ],
            );
          },
        );
        if (confirmed != true) {
          debugPrint('User denied permission at ${DateTime.now()}.');
          return null; // User denied, stay on current page
        }

        // On "Allow", open file picker with full access to mobile files and cloud
        debugPrint('Attempting to open file picker with full access at ${DateTime.now()}...');
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.any, // Allow all file types from anywhere (local or cloud)
          allowMultiple: false, // Single file for simplicity
          allowCompression: false, // Ensure all files are accessible
          withData: true, // Ensure file bytes are available
          withReadStream: true, // Support cloud files
        ).catchError((e) {
          debugPrint('File picker error during execution at ${DateTime.now()}: $e');
          return null; // Return null if picker fails
        });

        if (result != null && result.files.isNotEmpty) {
          debugPrint('File picked successfully: ${result.files.first.name} at ${DateTime.now()}.');
          // Optional: Upload to Firebase Storage with initialization check
          await _uploadToFirebase(result.files.first);
          return result;
        }
        debugPrint('Failed to pick file or open file picker at ${DateTime.now()}. Check emulator setup or use a device.');
        if (context != null && context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Access Issue'),
              content: const Text('Failed to open file picker. This may be due to emulator limitations. Please try on a physical device with Google Drive installed.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        return null;
      }
      return null;
    } catch (e) {
      debugPrint('Error picking file at ${DateTime.now()}: $e');
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to access files: $e. Please try on a device with Google Drive installed.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      return null;
    }
  }

  // Optional: Upload picked file to Firebase Storage with initialization guard
  static Future<void> _uploadToFirebase(PlatformFile file) async {
    try {
      final firebase_storage.FirebaseStorage storage;
      try {
        storage = firebase_storage.FirebaseStorage.instance; // Safe access after initialization
      } catch (e) {
        debugPrint('Firebase Storage not initialized at ${DateTime.now()}: $e');
        return; // Exit if not initialized
      }

      final firebase_storage.Reference ref = storage.ref().child('stops/${file.name}');

      final Uint8List? fileBytes = file.bytes;
      if (fileBytes != null) {
        await ref.putData(fileBytes);
        final String downloadUrl = await ref.getDownloadURL();
        debugPrint('File uploaded at ${DateTime.now()}: $downloadUrl');
        // Here, you can parse the file and process stops
      } else {
        // Handle file from path if bytes not available
        final File fileOnDisk = File(file.path!);
        await ref.putFile(fileOnDisk);
        debugPrint('File uploaded from path at ${DateTime.now()}: ${file.path}');
      }
    } catch (e) {
      debugPrint('Error uploading to Firebase at ${DateTime.now()}: $e');
    }
  }
}