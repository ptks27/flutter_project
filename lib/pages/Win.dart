import 'package:flutter/material.dart';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  final double coverHeight = 200;
  final double profileHeight = 100;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Center(child: Text('About us')),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildTop(),
            buildContent(),
          ],
        ));
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 1.5;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // สีขอบขาว
                width: 5.0, // ความกว้างขอบ
              ),
            ),
            child: buildProfileImage(),
          ),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset('lib/images/black.png',
            width: double.infinity, height: 220, fit: BoxFit.cover),
      );

  Widget buildProfileImage() => CircleAvatar(
      radius: 220 / 3,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: const AssetImage('lib/images/win.jpg'));

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'My Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 13,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          buildAbout(),
          const SizedBox(
            height: 32,
          ),
        ],
      );
  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle), // ไอคอน
                SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                Text(
                  ': Nattipan Jarunat',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'kanit',
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.assignment_ind), // ไอคอน
                SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                Text(
                  ': Student ID : 6421605320',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'kanit',
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.email), // ไอคอน
                SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                Text(
                  ': Nattipan.j@ku.th',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'kanit',
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.dialer_sip), // ไอคอน
                SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                Text(
                  ': 0983292109',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'kanit',
                      fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      );
}
