import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/gradient_button.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import 'dashboard_page.dart'; // Import the dashboard page

class YoutubeVideoPlayScreen extends StatefulWidget {
  final String userName;
  final String videoUrl;

  const YoutubeVideoPlayScreen({
    super.key,
    required this.userName,
    this.videoUrl = 'https://youtu.be/bP4U-L4EHcg',
  });

  @override
  State<YoutubeVideoPlayScreen> createState() => _YoutubeVideoPlayScreenState();
}

class _YoutubeVideoPlayScreenState extends State<YoutubeVideoPlayScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _initializeYoutubePlayer();
  }

  void _initializeYoutubePlayer() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${widget.userName}!'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // YouTube Video Player
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _youtubeController,
                showVideoProgressIndicator: true,
                progressColors: const ProgressBarColors(
                  playedColor: AppColors.primary,
                  handleColor: AppColors.primaryVariant,
                ),
                onReady: () {
                  _youtubeController.addListener(() {});
                },
              ),
            ),
          ),

          // WhatsApp Calling Section
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.phone, size: 50),
                    color: Colors.green,
                    onPressed: () {
                      // WhatsApp calling functionality will be added here
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GradientButton(
                      text: AppStrings.startCalling,
                      onPressed: () => _navigateToDashboard(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(
          userName: widget.userName,
          // userImageUrl: 'url_if_available' // optional parameter
        ),
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }
}