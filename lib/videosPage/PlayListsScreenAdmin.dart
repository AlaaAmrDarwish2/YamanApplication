import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'playlistVideos.dart';
import 'pv2.dart';
import 'pv3.dart';
import 'pv4.dart';
import 'pv5.dart';
import 'pv6.dart';

void main() {
  runApp(const PlayListsScreenAdmin());
}

class PlayListsScreenAdmin extends StatelessWidget {
  const PlayListsScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PlayListsScreenclass(),
        '/playlistVideos': (context) => playlistVideos(),
        '/pv2': (context) => pv2(),
        '/pv3': (context) => pv3(),
        '/pv4': (context) => pv4(),
        '/pv5': (context) => pv5(),
        '/pv6': (context) => pv6(),
        // Add more routes as needed
      },
    );
  }
}

class PlayListsScreenclass extends StatefulWidget {
  const PlayListsScreenclass({Key? key}) : super(key: key);

  @override
  _PlayListsScreenclassState createState() => _PlayListsScreenclassState();
}

class _PlayListsScreenclassState extends State<PlayListsScreenclass> {
  final List<Map<String, dynamic>> itemList = [
    {
      "label": "ارسم",
      "imagePath": "assets/img/1.jpg",
      "destination": "/playlistVideos"
    },
    {
      "label": "قصص وحكايات",
      "imagePath": "assets/img/2.jpg",
      "destination": "/pv2"
    },
    {
      "label": "سباق المعلومات",
      "imagePath": "assets/img/3.jpg",
      "destination": "/pv3"
    },
    {"label": "أناشيد", "imagePath": "assets/img/4.jpg", "destination": "/pv4"},
    {"label": "تجويد", "imagePath": "assets/img/6.jpg", "destination": "/pv5"},
    {
      "label": "ستوديو يمان",
      "imagePath": "assets/img/5.jpg",
      "destination": "/pv6"
    },

    // Add more items as needed
  ];

  void addItem(String label, String imagePath, String destination) {
    setState(() {
      itemList.add({
        "label": label,
        "imagePath": imagePath,
        "destination": destination,
      });
    });
  }

  void deleteItem(int index) {
    setState(() {
      itemList.removeAt(index);
    });
  }

  Future<void> _getImageAndAddItem() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    //   String imagePath = pickedFile.path;
    //   addItem("New Label", imagePath, "/pv2");
    // } else {
    //   print('No image selected.');
    // }
    if (pickedFile != null) {
      // Save image to a variable or upload it to a server
      String imagePath = pickedFile.path;

      // Show an alert dialog to get the label from the user
      String newLabel = await showDialog(
        context: context,
        builder: (BuildContext context) {
          String label = ''; // Initialize label variable
          return AlertDialog(
            title: Text('Enter Label'),
            content: TextField(
              onChanged: (value) {
                label = value; // Update label as user types
              },
              decoration: InputDecoration(
                hintText: 'Enter label',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
              TextButton(
                child: Text('Add'),
                onPressed: () {
                  Navigator.of(context)
                      .pop(label); // Return label when user taps Add
                },
              ),
            ],
          );
        },
      );

      // Add the new item with the entered label
      if (newLabel != null && newLabel.isNotEmpty) {
        addItem(newLabel, imagePath, "/pv2");
        print(imagePath);
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'فيديوهات',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        )),
        backgroundColor: const Color.fromARGB(255, 2, 152, 200),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Scrollbar(
            label: itemList[index]["label"],
            imagePath: itemList[index]["imagePath"],
            destination: itemList[index]["destination"],
            onDelete: () => deleteItem(index),
          );
        },
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 50,
        child: FloatingActionButton(
          onPressed: _getImageAndAddItem,

          backgroundColor: Color.fromARGB(255, 2, 152, 200), // Button color
          tooltip: 'Add Item',
          child: const Row(
            children: [
              Icon(Icons.add, color: Colors.white),
              // const SizedBox(width: 10),
              Text(
                'أضف',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Scrollbar extends StatelessWidget {
  final String? label;
  final String? imagePath;
  final String? destination;
  final VoidCallback? onDelete;

  const Scrollbar({
    Key? key,
    this.label,
    this.imagePath,
    this.destination,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, destination ?? '/');
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 300,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              alignment: Alignment.centerRight,
              child: Text(
                label ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 250, 182, 56),
                        width: 15,
                      ),
                      image: DecorationImage(
                        image: _getImageProvider(),
                        // AssetImage(
                        //     imagePath ?? "assets/img/placeholder_image.jpg"),
                        //     image: FileImage(File(imagePath ?? "")),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: onDelete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImageProvider() {
    if (imagePath != null && imagePath!.startsWith('assets/')) {
      // Use AssetImage for asset images
      return AssetImage(imagePath!);
    } else {
      // Use FileImage for external files
      return FileImage(File(imagePath ?? ""));
    }
  }
}
