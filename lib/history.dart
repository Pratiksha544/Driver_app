import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1C2526),
        child: Column(
          children: [
            Container(
              color: const Color(0xFF2A2F32),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const TextField(                            
                decoration: InputDecoration(        
                  icon: Icon(Icons.search,color: Colors.white38,),
                  hintText: 'Search Route by name, stops and more...',
                  hintStyle: TextStyle(color: Colors.white38),
                  suffixIcon: Icon(Icons.clear, color: Colors.white38),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: const Color(0xFF2A2F32),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C2526),
                      side: const BorderSide(color: Colors.blue),
                      minimumSize: const Size(230, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('+ Add New Route', style: TextStyle(color: Colors.blue)),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Text('Trips', style: TextStyle(color: Colors.white)),
                        Spacer(),
                        Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(), // Placeholder for content
              ),
            ),
          ],
        ),
      ),
    );
  }
}