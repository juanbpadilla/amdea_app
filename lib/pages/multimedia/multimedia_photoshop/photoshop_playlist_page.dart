import 'package:amdea_app/pages/multimedia/multimedia_photoshop/photoshop_video_page.dart';
import 'package:amdea_app/theme/app_theme.dart';
import 'package:amdea_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class PhotoshopPlaylistPage extends StatelessWidget {
  const PhotoshopPlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001E36),
        title: const Text("Photoshop"),
        centerTitle: true,
        toolbarHeight: 75,
        titleTextStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color(0xFF30A8FF)),
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
          const SizedBox(height: 8),
          cardButton(
              context, 'https://${AppConstants.ngrokUrl}/storage/D5XBKZvRjT6pEx3I0KUg2pbKE1CWX1CoWWUMLU0q.mp4',
              'Video 1'),
          cardButton(
              context, 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
              'Video 2'),
          cardButton(
              context, 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              'Video 3'),
        ],
      ),
    );
  }

  Widget cardButton(BuildContext context, String url, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        color: AppTheme.primary,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhotoshopVideoPage(
                        videoUrl: url,
                      )),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.video_collection_rounded, color: Colors.white,),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppTheme.boldFont,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}