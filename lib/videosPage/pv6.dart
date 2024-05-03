import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';

class pv6 extends StatelessWidget {
  final List<Map<String, String>> videoData = [
    {
      "title": " الااعجاز العلمي | ماذا يأكل الذباب | ناصح والذبابة الخارقة",
      "videoUrl": "Hn50FncG7_Y",
      "imagePath": "assets/img/5.jpg"
    },

    // Add more videos with their image paths and URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ستوديو يمان'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(10, 20, 20, 50),
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
        height: 200,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          // SizedBox(height: 20),
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
