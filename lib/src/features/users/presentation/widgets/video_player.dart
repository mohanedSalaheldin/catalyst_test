import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.url});
  final String url;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller with a URL
    _controller = VideoPlayerController.network(widget.url);

    // Initialize the controller and store the Future for use in build
    _initializeVideoPlayerFuture = _controller.initialize();

    // Start playing the video and set it to loop
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Dispose of the video player controller to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 260,
      child: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the video is initialized, display the player
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    height: 200,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10),
                        onPressed: () {
                          final currentPosition = _controller.value.position;
                          final newPosition =
                              currentPosition - const Duration(seconds: 10);
                          _controller.seekTo(newPosition >= Duration.zero
                              ? newPosition
                              : Duration.zero);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10),
                        onPressed: () {
                          final currentPosition = _controller.value.position;
                          final duration = _controller.value.duration;

                          final newPosition =
                              currentPosition + const Duration(seconds: 10);

                          if (newPosition <= duration) {
                            _controller.seekTo(newPosition);
                          } else {
                            _controller.seekTo(duration);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else {
              // Show a loading spinner while initializing
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
