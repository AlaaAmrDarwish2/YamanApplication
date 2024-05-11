import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'dart:math';
import 'package:file_picker/file_picker.dart';
// import 'dart:io';
import 'package:open_file/open_file.dart'; // for generating random colors

Future<void> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Device Model: ${androidInfo.model}');
}

void main() {
  runApp(const PdfApp());
}

class PdfApp extends StatelessWidget {
  const PdfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyPage(),
      initialRoute: '/',
      routes: {
        '/pdf': (context) => const PdfApp(),
      },
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<Widget> _pdfItems = [];
  // final List<Widget> _pdfItems = [
  //   PdfViewerItem(pdfAssetPath: 'assets/pdf/الفئران-الثلاثة.pdf'),
  //   PdfViewerItem(pdfAssetPath: 'assets/pdf/دوري.pdf'),
  //   PdfViewerItem(pdfAssetPath: 'assets/pdf/وجدت-القلم-الذهبيَّ.pdf'),
  // ];
  @override
  void initState() {
    super.initState();

    // Set initial items in initState or in a method
    _pdfItems.addAll([
      DeletablePdfItem(
        pdfAssetPath: 'assets/pdf/الفئران-الثلاثة.pdf',
        onDelete: _deleteItem,
        fileName: 'الفئران-الثلاثة.pdf', // Provide required fileName
        onOpen: () => _openFile('assets/pdf/الفئران-الثلاثة.pdf'),
      ),
      DeletablePdfItem(
        pdfAssetPath: 'assets/pdf/وجدت-القلم-الذهبيَّ.pdf',
        onDelete: _deleteItem,
        fileName:
            'assets/pdf/وجدت-القلم-الذهبيَّ.pdf', // Provide required fileName
        onOpen: () => _openFile('assets/pdf/وجدت-القلم-الذهبيَّ.pdf'),
      ),
    ]);
  }

  void _deleteItem(Widget item) {
    setState(() {
      _pdfItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'القصص',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 152, 200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: const Text(
              'صدر حديثا ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150,
            child: HorizontalScrollContainer(
              items: _pdfItems,
            ),
          ),
          ElevatedButton(
            onPressed: _pickFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 2, 152, 200), // Button color
            ),
            child:const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white), // Plus icon
                SizedBox(width: 8), // Spacing between icon and text
                Text(
                  "أضف",
                  style: TextStyle(color: Colors.white),
                ), // Button text
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      final path = file.path ?? 'default/path';
      final fileName = file.name ?? 'Unknown File';

      setState(() {
        _pdfItems.add(
          DeletablePdfItem(
            pdfAssetPath: path,
            fileName: fileName,
            onOpen: () => _openFile(path), // Open the file when tapped
            onDelete: (item) => _deleteItem(item), // Deletion functionality
          ),
        );
      });
    }
  }

  Future<void> _openFile(String? filePath) async {
    if (filePath == null) return;

    final result = await OpenFile.open(filePath);

    if (result.type == ResultType.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error opening file: ${result.message}")),
      );
    }
  }
}

class HorizontalScrollContainer extends StatelessWidget {
  final List<Widget> items;

  HorizontalScrollContainer({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}

class PdfViewerItem extends StatelessWidget {
  final String pdfAssetPath;

  PdfViewerItem({required this.pdfAssetPath});

  @override
  Widget build(BuildContext context) {
    final fileName = pdfAssetPath.split('/').last;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewerWidget(pdfAssetPath: pdfAssetPath),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: Color.fromARGB(255, 2, 152, 200), // Random background color
        child: Center(
          child: Text(
            '$fileName',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PdfViewerWidget extends StatelessWidget {
  final String pdfAssetPath;

  PdfViewerWidget({required this.pdfAssetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: SfPdfViewer.asset(pdfAssetPath),
    );
  }
}

class DeletablePdfItem extends StatelessWidget {
  // final String pdfAssetPath;
  // final Function(DeletablePdfItem) onDelete;
  // DeletablePdfItem({required this.pdfAssetPath, required this.onDelete});

  final String pdfAssetPath;
  final String fileName;
  final VoidCallback onOpen;
  final Function(DeletablePdfItem) onDelete;

  DeletablePdfItem({
    required this.pdfAssetPath,
    required this.fileName,
    required this.onOpen,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    final fileName = pdfAssetPath.split('/').last;

    return Stack(
      // children: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) =>
      //                 PdfViewerWidget(pdfAssetPath: pdfAssetPath),
      //           ),
      //         );
      //       },
      //       child: Container(
      //         width: 150,
      //         height: 150,
      //         margin: const EdgeInsets.symmetric(horizontal: 8),
      //         color: const Color.fromARGB(255, 2, 152, 200),
      //         child: Center(
      //           child: Text(
      //             fileName,
      //             style: const TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.topRight,
      //       child: IconButton(
      //         icon: const Icon(Icons.close, color: Colors.white),
      //         onPressed: () => onDelete(this),
      //       ),
      //     ),
      //   ],
      children: [
        GestureDetector(
          onTap: onOpen, // Open file when tapped
          child: Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(
                  255, 2, 152, 200), // Curved borders with radius 20
            ),
            child: Center(
              child: Text(
                fileName, // Display file name
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => onDelete(this), // Delete action
          ),
        ),
      ],
    );
  }
}
