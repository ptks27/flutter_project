import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Myvideo extends StatefulWidget {
  const Myvideo({super.key});

  @override
  State<Myvideo> createState() => _MyvideoState();
}

class _MyvideoState extends State<Myvideo> {
  VideoPlayerController? controller;

  String dataSource = 'https://img.pikbest.com/09/41/52/11MpIkbEsT7Jf.mp4';

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });

    controller!.play();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('video'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: VideoPlayer(controller!),
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
        ],
      ),
    );
  }
}
