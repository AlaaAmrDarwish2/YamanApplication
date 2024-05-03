import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';

class pv4 extends StatelessWidget {
  final List<Map<String, String>> videoData = [
    {
      "title": "نشيد زي ايه العمل الصالح اللي نعمله",
      "videoUrl": "wzyGtJBlfZI",
      "imagePath": "assets/img/4.jpg"
    },
    {
      "title": "نشيد ذهب الليل مع مشكلة من أهم مشكلات التربية",
      "videoUrl": "v=B58Pkn4Jvps",
      "imagePath": "assets/img/42.jpg"
    },
    {
      "title": "أجمل أناشيد وأغاني الأطفال محموعه 1",
      "videoUrl": "R9MFLDzhktE",
      "imagePath": "assets/img/43.jpg"
    },
    {
      "title": "الأشكال الهندسية مع يمان",
      "videoUrl": "zKfOplB3VSM",
      "imagePath": "assets/img/44.jpg"
    },
    {
      "title": "قيمة الوقت - استخدام الأجهزة الالكترونية- نشيد بأناملنا",
      "videoUrl": "9r3gty4FmDI",
      "imagePath": "assets/img/45.jpg"
    },
    {
      "title": "حروف الهجاء العربية - نشيد قطار الحروف ج ح خ",
      "videoUrl": "ay3hVDiziGU",
      "imagePath": "assets/img/46.jpg"
    },
    {
      "title": "حروف الهجاء العربيه نشيد قطار الحروف أ ب ت ث",
      "videoUrl": "qMnsNPlRPec",
      "imagePath": "assets/img/47.jpg"
    },
    {
      "title": "نظافة الأسنان للأطفال - نشيد زن زن الفرشاة أم المسواك ",
      "videoUrl": "Mk4B1Brw54c",
      "imagePath": "assets/img/48.jpg"
    },
    {
      "title": "حروف الهجاء العربية - نشيد قطار الحروف س ش ص ض ",
      "videoUrl": "FYpkAzXtLnI",
      "imagePath": "assets/img/49.jpg"
    },
    {
      "title": "حروف الهجاء العربية - نشيد قطار الحروف ط ظ ع غ ",
      "videoUrl": "fGiYBVuYjm8",
      "imagePath": "assets/img/410.jpg"
    },

    // Add more videos with their image paths and URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أناشيد '),
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
        height: 200,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
