import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';

class pv3 extends StatelessWidget {
  final List<Map<String, String>> videoData = [
    {
      "title": "ثلث ساعة أسئلة و أجوبة مع يمان نشط عقلك اختبر ذكائك",
      "videoUrl": "w1NKm6beHy8",
      "imagePath": "assets/img/3.jpg"
    },
    {
      "title": "سباق المعلومات مع يمان 6 نشط عقلك واختبر ذكائك |أطفال س و ج",
      "videoUrl": "rTGxwUWe6zQ",
      "imagePath": "assets/img/3.jpg"
    },
    {
      "title": "سباق المعلومات مع يمان 5 نشط عقلك واختبر ذكائك |أطفال س و ج",
      "videoUrl": "myBpvCrMrlE",
      "imagePath": "assets/img/3.jpg"
    },
    {
      "title": "سباق المعلومات مع يمان 4 نشط عقلك واختبر ذكائك |أطفال س و ج",
      "videoUrl": "oa18WSIgBK4",
      "imagePath": "assets/img/3.jpg"
    },
    {
      "title": "سباق المعلومات مع يمان 3 نشط عقلك واختبر ذكائك |أطفال س و ج",
      "videoUrl": "qvc1OvIa7r8",
      "imagePath": "assets/img/3.jpg"
    },
    // Add more videos with their image paths and URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سباق المعلومات'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(5, 20, 0, 50),
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
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      leading: Container(
        width: 100,
        height: 200,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
