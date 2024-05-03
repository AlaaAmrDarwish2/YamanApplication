import 'package:flutter/material.dart';
import 'package:myapp/login_Signup/login.dart';
// import 'package:myapp/login_Signup/login_screen.dart';
// import 'package:flutter_application_8/main2.dart';
// import 'package:flutter_application_8/HomeScreen.dart';
// import 'package:flutter_application_8/myBottomNavigationBar.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home:const MainScreenclass(
        title: '',
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(email:'',password:''),
      },
    );
  }
}

class MainScreenclass extends StatefulWidget {
  const MainScreenclass({super.key, required this.title});

  final String title;

  @override
  State<MainScreenclass> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreenclass> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        centerTitle: true,
        toolbarHeight: 630,
        actions: const <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 57, top: 180),
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Color.fromARGB(1000, 4, 152, 200),
                backgroundImage: AssetImage('assets/img/page.png'),
              ),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(550),
                bottomRight: Radius.circular(550))),
      ),
      body: Center(
          // child: CircleAvatar(
          //   radius: 150,
          //   backgroundColor: Color.fromARGB(1000, 4, 152, 200),
          //   backgroundImage: AssetImage('assets/img/page.png'),
          // ),
          child: 
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
            backgroundColor:const Color.fromARGB(1500, 2, 152, 200), // Background color
            foregroundColor: Colors.white, // Text color 
            padding: const EdgeInsets.only(left: 20 ,right: 20 ,top: 16 , bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0), // Button border radius
            ),
            elevation: 0, // Button elevation
          ), 
            child:
            const Text('ابدأ الآن',
            style: TextStyle(fontSize: 20 ) ,

            
            ), 
          ),
      ),
    );
  }
}
