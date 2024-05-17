import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'videoPlayerPage.dart';

class PlaylistVideosAdmin extends StatefulWidget {
  @override
  _PlaylistVideosState createState() => _PlaylistVideosState();
}

class _PlaylistVideosState extends State<PlaylistVideosAdmin> {
  final List<Map<String, dynamic>> videoData = [
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
        title: const Text('ارسم'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(10, 20, 20, 50),
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
  // final String? _pickedImagePath;
  // final String? _pickedImage;
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
        height: 200,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: AssetImage(videoImage ?? "assets/img/2.jpg"),
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
