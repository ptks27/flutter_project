import 'package:flutter/material.dart';
import 'package:project/models/cart.dart';

import 'package:provider/provider.dart';

import 'pages/intro_page1.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage1(),
    );
  }
}
