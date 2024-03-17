import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:project/pages/about_page.dart';

import 'package:project/pages/intro_page1.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigatorBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 210, 210),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 211, 210, 210),
        color: Color.fromARGB(255, 236, 236, 236),
        animationDuration: Duration(milliseconds: 300),
        items: [
          const Icon(
            Icons.home,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          const Icon(
            Icons.local_grocery_store,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ],
        onTap: (index) {
          navigatorBottomBar(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SingleChildScrollView(
          child: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        title: const Center(
          child: Text(
            'LaLiga Shirt Shop',
            style: TextStyle(
                fontFamily: 'kanit',
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //logo
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/la.png',
                      color: Colors.white,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[800],
                    ),
                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          title: Text(
                            'About us',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntroPage1(),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 25),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
