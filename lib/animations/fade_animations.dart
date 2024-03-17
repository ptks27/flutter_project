import 'package:flutter/material.dart';

enum Aniprops { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({super.key, required this.child, required this.delay});

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    
    return const Placeholder();
  }
}
