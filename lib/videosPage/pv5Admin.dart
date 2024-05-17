import 'package:flutter/material.dart';
import 'videoPlayerPage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class pv5Admin extends StatefulWidget {
  @override
  _PlaylistVideosState createState() => _PlaylistVideosState();
}

class _PlaylistVideosState extends State<pv5Admin> {
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
  void _deleteItem(int index) {
    setState(() {
      videoData.removeAt(index);
    });
  }

  String? _pickedImagePath;
  File? _pickedImage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تجويد'),
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
            index: index,
            onDelete: (int index) {
              _deleteItem(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewItem(context);
        },
        backgroundColor: Color.fromARGB(255, 2, 152, 200),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _addNewItem(BuildContext context) async {
    // final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   setState(() {
    //     _pickedImagePath = pickedFile.path;
    //   });
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });

      String imagePath = pickedFile.path;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTitle = "";
          String newUrl = "";

          return AlertDialog(
            title: Text("Add New Item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onChanged: (value) {
                    newTitle = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Video URL'),
                  onChanged: (value) {
                    newUrl = value;
                  },
                ),
                // _pickedImagePath != null
                //     ? Image.file(File(_pickedImagePath!))
                //     : SizedBox(),
                _pickedImage != null ? Image.file(_pickedImage!) : SizedBox(),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    videoData.add({
                      "title": newTitle,
                      "videoUrl": newUrl,
                      // "imagePath": _pickedImagePath,
                      "imagePath": imagePath,
                    });
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }
}

class VideoListItem extends StatelessWidget {
  final String? videoTitle;
  final String? videoUrl;
  final String? videoImage;
  final int index; // Index of the item in the list
  final Function(int) onDelete;

  VideoListItem(
      {this.videoTitle,
      this.videoUrl,
      this.videoImage,
      required this.index,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> imageProvider;
    if (videoImage != null && videoImage!.startsWith("assets/")) {
      // Load asset image
      imageProvider = AssetImage(videoImage!);
    } else {
      // Load file image
      imageProvider = FileImage(File(videoImage!));
    }
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
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          onDelete(index); // Call onDelete callback with index
        },
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
