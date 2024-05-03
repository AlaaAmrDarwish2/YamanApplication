import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';

class playlistVideos extends StatelessWidget {
  final List<Map<String, String>> videoData = [
    {
      "title": "طريقة رسم الخضراوات",
      "videoUrl": "iXUr-Q31j5Y",
      "imagePath": "assets/img/1.jpg"
    },
    {
      "title": "طريقة رسم الفراشة",
      "videoUrl": "xMDO-OHAv4U",
      "imagePath": "assets/img/222.jpg"
    },
    {
      "title": "طريقة رسم النحلة",
      "videoUrl": "4f3My8ItrVY",
      "imagePath": "assets/img/23.jpg"
    },
    {
      "title": "طريقة رسم فانوس و هلال رمضان",
      "videoUrl": "IWi8QFHefQQ",
      "imagePath": "assets/img/24.jpg"
    },
    {
      "title": "مبادرة تنمية قدرات | قصة حوت يونس",
      "videoUrl": "48h4JsUOu34",
      "imagePath": "assets/img/25.jpg"
    },
    {
      "title": "مبادرة تنمية قدرات | قصة سفينة نوح",
      "videoUrl": "48h4JsUOu34",
      "imagePath": "assets/img/26.jpg"
    },
    {
      "title": "مبادرة تنمية قدرات | فيل أبرهة",
      "videoUrl": "m9xzqu51H7Y",
      "imagePath": "assets/img/27.jpg"
    },
    {
      "title": "مبادرة تنمية قدرات ومواهب الأطفال | ارسم لون 2",
      "videoUrl": "hE9WbqXNYUM",
      "imagePath": "assets/img/28.jpg"
    },
    {
      "title": "مبادرة تنمية و مواهب الأطفال | ارسم لون 1",
      "videoUrl": "vdcan59pnMY",
      "imagePath": "assets/img/29.jpg"
    },

    // Add more videos with their image paths and URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ارسم '),
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
