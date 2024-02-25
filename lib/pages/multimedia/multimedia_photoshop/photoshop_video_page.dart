import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotoshopVideoPage extends StatefulWidget {
  final String videoUrl;
  const PhotoshopVideoPage({super.key, required this.videoUrl});


  @override
  State<PhotoshopVideoPage> createState() => _PhotoshopVideoPageState();
}

class _PhotoshopVideoPageState extends State<PhotoshopVideoPage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  // String _videoUrl = 'https://7c8a-2800-cd0-df45-100-790b-cc19-6bab-d822.ngrok-free.app/storage/D5XBKZvRjT6pEx3I0KUg2pbKE1CWX1CoWWUMLU0q.mp4';

  @override
  void initState() {
    super.initState();
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001E36),
        title: const Text("PHOTOSHOP"),
        centerTitle: true,
        toolbarHeight: 75,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Color(0xFF30A8FF)
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Color(0xFF30A8FF),
            size: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          // const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }

  
}
