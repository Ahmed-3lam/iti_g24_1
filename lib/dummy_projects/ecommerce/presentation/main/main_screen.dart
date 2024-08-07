import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: _screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: [
          Icon(Icons.home, size: 30),
          Icon(CupertinoIcons.cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (i) {
          index = i;
          setState(() {});
        },
      ),
    );
  }
}
