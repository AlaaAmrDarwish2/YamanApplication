import 'package:flutter/material.dart';
// import 'package:flutter_application_8/HomeScreen.dart';
// import 'package:flutter_application_8/MainScreen.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<void> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Device Model: ${androidInfo.model}');
}

void main() {
  runApp(const pdf());
  // FlutterPdfviewPlugin.init();
}

// ignore: camel_case_types
class pdf extends StatelessWidget {
  const pdf({super.key});

  void initState() {
    // super.initState();
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    // ;
    return MaterialApp(
      home: MyPage(),
      initialRoute: '/',
      routes: {
        // '/home': (context) => const HomeScreen(),
        '/pdf': (context) => const pdf(),
        // '/contact': (context) => const MainScreen(),
      },
    );
  }
}

// ignore: camel_case_types


class MyPage extends StatelessWidget {
  final String? pdf;
  MyPage({this.pdf});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'القصص',
          style: TextStyle(color: Color.fromARGB(1500, 255, 255, 255)),
        )),
        backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: Column(
        children: [
          
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: const Text(
              'صدر حديثا ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 150,
            child: HorizontalScrollContainer(
              items: [
                PdfViewerItem(pdfAssetPath: 'assets/pdf/الفئران-الثلاثة.pdf'),
                PdfViewerItem(pdfAssetPath: 'assets/pdf/دوري.pdf'),
                PdfViewerItem(
                    pdfAssetPath: 'assets/pdf/وجدت-القلم-الذهبيَّ.pdf'),
                // Add more items with different PDF paths
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: const Text(
              'قصص متنوعة',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 150,
            child: HorizontalScrollContainer(
              items: [
                PdfViewerItem(pdfAssetPath: 'assets/pdf/الفئران-الثلاثة.pdf'),
                PdfViewerItem(pdfAssetPath: 'assets/pdf/دوري.pdf'),
                PdfViewerItem(
                    pdfAssetPath: 'assets/pdf/وجدت-القلم-الذهبيَّ.pdf'),
                // Add more items with different PDF paths
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index, Color color) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: color,
      child: Center(
        child: Text(
          'Item $index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
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
      reverse: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle the onTap event, for example, open the PDF
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => items[index],
              ),
            );
          },
          child: items[index],
        );
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
        // Handle the onTap event, for example, open the PDF
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
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(10.0), // Set your desired corner radius
          child: Container(
            color: const Color.fromARGB(255, 2, 152, 200),
            padding:
                const EdgeInsets.all(20), // Set your desired background color
            child: Center(
              // child: Padding(
              //   padding: const EdgeInsets.all(5.0),
              child: Text(
                '$fileName',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
///////////

// child: Container(
//   width: 150,
//   height: 150,
//   margin: EdgeInsets.symmetric(horizontal: 8),
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(10.0), // Set your desired corner radius
//     child: Container(
//       color: Color.fromARGB(255, 103, 150, 138),
//       padding: EdgeInsets.all(20), // Set your desired background color
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             '$fileName',
//             style: TextStyle(color: Colors.white,fontSize: 20,),
//           ),
//         ),
//       ),
//     ),
//   ),
// ),
////////////
class PdfViewerWidget extends StatelessWidget {
  final String pdfAssetPath;

  PdfViewerWidget({required this.pdfAssetPath});

  @override
  Widget build(BuildContext context) {
    // final fileName = pdfAssetPath.split('/').last;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body:
          // PDFView(
          //   filePath: 'assets/الفئران-الثلاثة.pdf',
          //   autoSpacing: true,
          //   pageSnap: true,
          //   pageFling: true,
          // ),
          SfPdfViewer.asset(pdfAssetPath),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<homePage> {
  
  int _intpage = 0;
  late String title2;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home_rounded,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.message_rounded,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.video_collection_rounded,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.account_circle,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.settings,
        color: Colors.white,
        size: 30,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: 0,
        items: items,
        color: const Color.fromARGB(1500, 2, 152, 200),
        buttonBackgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                _intpage = index;
                Navigator.pushNamed(context, '/home');
              });
              break;
            case 1:
              setState(() {
                _intpage = index;
                Navigator.pushNamed(context, '/pdf');
              });
              break;
            case 2:
              setState(() {
                _intpage = index;
                Navigator.pushNamed(context, '/pdf');
              });
              break;
            case 3:
              setState(() {
                _intpage = index;
                Navigator.pushNamed(context, '/pdf');
              });
              break;
            case 4:
              setState(() {
                _intpage = index;
                Navigator.pushNamed(context, '/pdf');
              });
              break;
          }
          // setState(() {
          //   _intpage = index;
          // });
        },
        letIndexChange: (index) => true,
      ),
      appBar: AppBar(
        title: Text(_getTitle()),
        backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        centerTitle: true,
        toolbarHeight: 75,
        actions: const <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 57, top: 180),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: Container(),
    );
  }

  String _getTitle() {
    switch (_intpage) {
      case 0:
        return 'الصفحة الرئيسية';
      case 1:
        return 'القصص';
      case 2:
        return 'الفيديوهات';
      case 3:
        return 'الحساب';
      case 4:
        return 'الاعدادات';
      // Add more cases for additional tabs
      default:
        return 'قناة يمان للأطفال';
    }
  }
}
  
