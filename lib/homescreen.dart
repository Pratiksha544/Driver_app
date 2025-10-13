import 'package:flutter/material.dart';
import 'history.dart';
import 'support.dart';
import 'onride.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HistoryScreen(),
    HelpSupportScreen(),
    OnRideScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2526),
        actions: _selectedIndex == 0
            ? const [
              SizedBox(width: 20,),
               Text('History',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),textAlign: TextAlign.start,),Spacer(),
                Icon(Icons.calendar_today, color: Colors.white),
                SizedBox(width: 16),
              ]
            : null,
            
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF1E90FF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'On Ride',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}