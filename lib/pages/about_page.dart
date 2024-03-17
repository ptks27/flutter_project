
import 'package:flutter/material.dart';
import 'package:project/components/bottom_nav_bar.dart';
import 'package:project/pages/Bas.dart';
import 'package:project/pages/Win.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final double coverHeight = 200;
  final double profileHeight = 100;

  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Bas(),
    const Win(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      bottomNavigationBar: MyBottomBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
    
  }
}
