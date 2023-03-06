import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/auth_controller.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/auth_state.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/home_controller.dart';
import 'package:seventh_flutter_app/app/shared/dependency_injection/dependency_injection.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerHome extends StatefulWidget {
  const VideoPlayerHome(this.urlVideo, {super.key});
  final String urlVideo;
  @override
  State<VideoPlayerHome> createState() => _VideoPlayerHomeState();
}

class _VideoPlayerHomeState extends State<VideoPlayerHome> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  final authController = inject.get<AuthController>();

  @override
  void initState() {
    // inicializando controllers
    _videoPlayerController = VideoPlayerController.network(widget.urlVideo,
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      isLive: true,
      allowMuting: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    authController.state.addListener(() {
      if (authController.state.value.state == AuthState.error) {
        _chewieController.pause();
        _chewieController.dispose();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}
