import 'package:flutter/material.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String id;

  const WebViewScreen(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayer(
        controller: YoutubePlayerController(initialVideoId: id),
        showVideoProgressIndicator: true,


      ),

    );
  }
}
