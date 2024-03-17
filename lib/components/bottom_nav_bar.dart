import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  MyBottomBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Color.fromARGB(255, 22, 22, 22),
      child: GNav(
        color: Color.fromARGB(255, 107, 107, 107),
        activeColor: Color.fromARGB(255, 39, 39, 39),
        tabBackgroundColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.center,
        textSize: 20,
        tabBorderRadius: 40,
        iconSize: 30,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.account_circle_sharp,
            text: ' Bas',
            textStyle: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'kanit'),
          ),
          GButton(
            icon: Icons.account_circle_sharp,
            text: ' Win',
            textStyle: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'kanit'),
          )
        ],
      ),
    );
  }
}
