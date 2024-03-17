import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:video_player/video_player.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  VideoPlayerController _controller =
      VideoPlayerController.asset('lib/images/test.mp4');

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    await _controller.initialize();
    setState(() {});
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller
        .dispose(); // ต้องเรียก dispose() เมื่อไม่ต้องการใช้งานวิดีโออีกต่อไป
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          // Video background
          _controller.value.isInitialized
              ? Positioned.fill(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : Container(),

          // Your content
          Center(
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
                      color: Colors.white,
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
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 24),

                  //sub title
                  const Text(
                    'Welcome to the LaLiga shirt shop. There are many teams, whether you support Real Madrid or FC Barcelona, Atletico Madrid or any other club.',
                    style: TextStyle(
                      fontFamily: 'kanit',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color.fromARGB(255, 167, 167, 167),
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
        ],
      ),
    );
  }
}
