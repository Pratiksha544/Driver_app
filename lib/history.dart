import 'package:demo/onride.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedOption = 'Trips'; // Default option


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
              child: Row(
                children: [
                  Expanded(
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white38),
                        hintText: 'Search Route by name, stops and more...',
                        hintStyle: TextStyle(color: Colors.white38),
                        suffixIcon: Icon(Icons.clear, color: Colors.white38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: const Color(0xFF2A2F32),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
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
                          transitionDuration: const Duration(milliseconds: 10),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C2526),
                      side: const BorderSide(color: Colors.blue),
                      minimumSize: const Size(230, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      '+ Add New Route',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                  onTap: () async {
                    final selected = await showMenu<String>(
                      context: context,
                      // 👇 Increased the top offset from 150 → 200 (you can tweak this)
                      position: const RelativeRect.fromLTRB(250, 230, 30, 0),
                      items: [
                        const PopupMenuItem(value: 'Trips', child: Text('Trips')),
                        const PopupMenuItem(value: 'Payments', child: Text('Payments')),
                        const PopupMenuItem(value: 'Coupons', child: Text('Coupons')),
                      ],
                    );
                    if (selected != null) {
                      setState(() {
                        _selectedOption = selected;
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(_selectedOption, style: const TextStyle(color: Colors.white)),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    ),
                  ),
                )

                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
