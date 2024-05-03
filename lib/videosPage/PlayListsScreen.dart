import 'package:flutter/material.dart';
import 'playlistVideos.dart';
import 'pv2.dart';
import 'pv3.dart';
import 'pv4.dart';
import 'pv5.dart';
import 'pv6.dart';

void main() {
  runApp(const PlayListsScreen());
}

class PlayListsScreen extends StatelessWidget {
  const PlayListsScreen({super.key});


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

class PlayListsScreenclass extends StatelessWidget {
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

   PlayListsScreenclass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text('فيديوهات',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),),)),
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
          );
        },
      ),
    );
  }
}

class Scrollbar extends StatelessWidget {
  final String? label;
  final String? imagePath;
  final String? destination;

  const Scrollbar({super.key, this.label, this.imagePath, this.destination});

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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 250, 182, 56),width: 15,),
                  image: DecorationImage(
                    image:
                        AssetImage(imagePath ?? "assets/img/placeholder_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
