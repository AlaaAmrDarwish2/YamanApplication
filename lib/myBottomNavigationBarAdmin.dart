import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp/HomeScreenAdmin.dart';
import 'package:myapp/login_Signup/account.dart';
import 'package:myapp/settings.dart';
// import 'package:myapp/stories/StoriesScreen.dart';
import 'package:myapp/storiesAdmin/StoriesScreenAdmin.dart';
import 'package:myapp/videosPage/PlayListsScreenAdmin.dart';
// import 'package:myapp/videosPage/PlayListsScreen.dart';

class MyNavAdmin extends StatelessWidget {
  const MyNavAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: myBottonNavigationBarAdmin(),
    );
  }
}

void main() {
  runApp(const MyNavAdmin());
  // FlutterPdfviewPlugin.init();
}

// ignore: camel_case_types
class myBottonNavigationBarAdmin extends StatefulWidget {
  const myBottonNavigationBarAdmin({super.key});

  @override
  State<myBottonNavigationBarAdmin> createState() => _MyNavState();
}

class _MyNavState extends State<myBottonNavigationBarAdmin> {
  int _intpage = 0;
  void onTapped(int index) {
    setState(() {
      _intpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _Children = [
      const HomeScreenAdmin(),
      const PdfApp(),
      const PlayListsScreenAdmin(),
      const account(),
      settings()
    ];
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
      body: _Children[_intpage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: 0,
        items: items,
        color: const Color.fromARGB(1500, 2, 152, 200),
        buttonBackgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: onTapped,
        letIndexChange: (index) => true,
      ),
    );
  }
}
