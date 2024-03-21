import 'package:flutter/material.dart';
import 'package:amity_video_player/amity_video_player.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
void initiateAmityVideoPlayerClient() {
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Create Post",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            // AmityVideoPlayer(
            //   controller: AmityVideoContoller(streamId: ),
            // )
          ],
        ),
      ),
    );
  }
}
