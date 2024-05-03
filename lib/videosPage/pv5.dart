import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';

class pv5 extends StatelessWidget {
  final List<Map<String, String>> videoData = [
    {
      "title": "سوره البينه",
      "videoUrl": "3-pkAANF44g",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سوره قريش",
      "videoUrl": "LuPAMoA-BW8",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة الماعون",
      "videoUrl": "c3WYtXkxeTs",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سوره النصر",
      "videoUrl": "_lEN0KeuVIg",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة المسد",
      "videoUrl": "cLapqTD3EGs",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة الاخلاص",
      "videoUrl": "hOmzFhymgWQ",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة الزلزلة",
      "videoUrl": "xx63T_Bjg_c",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة العاديات",
      "videoUrl": "W1mAwhD8I-s",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة الكوثر",
      "videoUrl": "M1COwOpK8N0",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة القارعة",
      "videoUrl": "Bpln19sH59g",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة التكاثر",
      "videoUrl": "-WX-JiG2pVc",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة العصر",
      "videoUrl": "DI9nVDRc5hc",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة الهمزة",
      "videoUrl": "dDelfLw45Fs",
      "imagePath": "assets/img/6.jpg"
    },
    {
      "title": "سورة الفيل",
      "videoUrl": "Q-8W90U_cq8",
      "imagePath": "assets/img/6.jpg"
    },

    // Add more videos with their image paths and URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' تجويد'),
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
