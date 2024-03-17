import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/la.png',
                  height: 240,
                ),
              ),

              //title
              const Text(
                'LaLiga shirt shop ',
                style: TextStyle(
                  fontFamily: 'kanit',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 24),

              //sub title
              const Text(
                'Welcome to the LaLiga shirt shop. There are many teams, whether you support Real Madrid or FC Barcelona, ​​Atletico Madrid or any other club.',
                style: TextStyle(
                  fontFamily: 'kanit',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromARGB(255, 83, 83, 83),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 46),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
