import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';

class pv2 extends StatelessWidget {
  final List<Map<String, String>> videoData = [
    {
      "title": "صغار الدوري المبدعون - الأطفال يقدروا يحلوا مشاكل الكبار",
      "videoUrl": "GkBSGSzibxA",
      "imagePath": "assets/img/2.jpg"
    },
    {
      "title": "ماذا أفعل لو وجدت القلم الذهبي - الأمانه",
      "videoUrl": "HHS17A694Bg",
      "imagePath": "assets/img/22.jpg"
    },

    // Add more videos with their image paths and URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' قصص و حكايات'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(5, 20, 0, 50),
        // margin: EdgeInsets.fromLTRB(0, 0, 0, 20),

        itemCount: videoData.length,
        itemBuilder: (context, index) {
          return VideoListItem(
            videoTitle: videoData[index]["title"],
            videoUrl: videoData[index]["videoUrl"],
            videoImage: videoData[index]["imagePath"],
          );
        },
      ),
    );
  }
}

class VideoListItem extends StatelessWidget {
  final String? videoTitle;
  final String? videoUrl;
  final String? videoImage;

  VideoListItem({this.videoTitle, this.videoUrl, this.videoImage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        videoTitle ?? "",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      leading: Container(
        width: 100,
        height: 100,
        // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(videoImage ?? "assets/img/default_thumbnail.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YoutubePlayerPage(videoId: videoUrl!),
          ),
        );
      },
    );
  }
}
