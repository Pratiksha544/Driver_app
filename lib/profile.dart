import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C2526),
      child: const Center(
        child: Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}