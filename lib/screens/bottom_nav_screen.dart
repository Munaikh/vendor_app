import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:vendor_app/screens/account_screen.dart';
import 'package:vendor_app/screens/home_screen.dart';
import 'package:vendor_app/screens/second_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    SecondScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.business),
            label: 'Business',
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: 'person',
          ),
        ],
        onDestinationSelected: (index) {
          
          _onItemTapped(index);
        },
      ),
    );
  }
}
