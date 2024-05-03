// import 'dart:js_util';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreenclass(
        title: '',
      ),
    );
  }
}

class HomeScreenclass extends StatefulWidget {
  const HomeScreenclass({super.key, required this.title});

  final String title;

  @override
  State<HomeScreenclass> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreenclass>
    with SingleTickerProviderStateMixin {
  late String title2;
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
    ]).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
    ]).animate(_controller);
    _controller.repeat();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //  CircleAvatar(
        //     radius: 150,
        //     backgroundColor: Color.fromARGB(1000, 4, 152, 200),
        //     backgroundImage: AssetImage('assets/img/page.png'),
        //   ),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          'الصفحة الرئيسية',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        centerTitle: true,
        toolbarHeight: 50,
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
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color.fromARGB(1500, 16, 108, 144),
                          Color.fromARGB(1500, 2, 152, 200),
                          // Color.fromARGB(1500,208,0,0),
                          Color.fromARGB(1500, 11, 182, 217),
                        ],
                        begin: _topAlignmentAnimation.value,
                        end: _bottomAlignmentAnimation.value,
                        // begin: _topAlignmentAnimation.value,
                        // end: _bottomAlignmentAnimation.value,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        " قناة يمان للأطفال .. مرح .. علم .. اخلاق .. و امان قناة هادفة للأطفال",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(1500, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
            // if (_intpage == 0)
            //   const Icon(
            //     Icons.home_rounded,
            //     size: 30,
            //   ),

            // if (_intpage == 1)
            //   const Icon(
            //     Icons.message_rounded,
            //     size: 30,
            //   ),
            // if (_intpage == 2)
            //   const Icon(
            //     Icons.video_collection_rounded,
            //     size: 30,
            //   ),
            // if (_intpage == 3)
            //   const Icon(
            //     Icons.account_circle,
            //     size: 30,
            //   ),
            // if (_intpage == 4)
            //   const Icon(
            //     Icons.settings,
            //     size: 30,
            //   ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(onPressed: () {}, child: const Text('اقرأ')),
                ElevatedButton(
                  onPressed: () {
                    //navigate
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        1500, 2, 152, 200), // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 16, bottom: 16),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50.0), // Button border radius
                    ),
                    elevation: 0, // Button elevation
                  ),
                  child: const Text(
                    'اقرأ ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //navigate
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        1500, 2, 152, 200), // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 16, bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50.0), // Button border radius
                    ),
                    elevation: 0, // Button elevation
                  ),
                  child: const Text(
                    'شاهد الآن',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
