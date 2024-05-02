import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/native_communicator/native_communicator.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late CachedVideoPlayerPlusController controller;

  String nativeText = '';

  @override
  void initState() {
    super.initState();
    gettingData();
    controller = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(minutes: 10),
    )..initialize().then((value) async {
        await controller.setLooping(true);
        controller.play();
        setState(() {});
      });
  }

  void gettingData() async {
    final data = await NativeCommunicator.getNativeData();
    setState(() {
      nativeText = data;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(
        children: [
          Text(
            'Native Text showing below',
          ),
          SizedBox(
            height: 20,
          ),
          Text(nativeText),
          SizedBox(
            height: 20,
          ),
          Center(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CachedVideoPlayerPlus(controller),
                  )
                : const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
