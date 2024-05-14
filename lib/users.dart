import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login_Signup/login.dart';
import 'package:myapp/login_SignupAdmin/loginAdmin.dart';
import 'package:myapp/myBottomNavigationBar.dart';
import 'package:myapp/myBottomNavigationBarAdmin.dart';
// import 'package:myapp/myBottomNavigationBarAdmin.dart';
// import 'package:myapp/login_Signup/login_screen.dart';
// import 'package:flutter_application_8/main2.dart';
// import 'package:flutter_application_8/HomeScreen.dart';
// import 'package:flutter_application_8/myBottomNavigationBar.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyA3QHtrkb4efcW2D5ILfhOnPnQ6hAznhIw',
            appId: "1:1065969017070:web:92c82404068ed35aecd3ff",
            messagingSenderId: "1065969017070",
            projectId: "yaman-9026a",
            ));
  }
  await Firebase.initializeApp();
  runApp(const users());
}

// ignore: camel_case_types
class users extends StatelessWidget {
  const users({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const users2(
        title: '',
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(email: '', password: ''),
        '/myBottomNavigationBarAdmin': (context) => const MyNavAdmin(), 
        '/myBottomNavigationBar': (context) =>const MyNav(), 
        '/loginAdmin':(context) =>  const LoginAppAdmin(),
        
      },
    );
  }
}

// ignore: camel_case_types
class users2 extends StatefulWidget {
  const users2({super.key, required this.title});

  final String title;

  @override
  State<users2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<users2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المستخدم',
          style: TextStyle(color: Color.fromARGB(1500, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text(' : تسجيل الدخول' , style: TextStyle(fontSize: 25,color: Color.fromARGB(1500, 2, 152, 200)),)),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginAdmin');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(1500, 2, 152, 200), // Background color
                foregroundColor: Colors.white, // Text color
                padding:
                    const EdgeInsets.only(left: 60, right: 60, top: 16, bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0), // Button border radius
                ),
                elevation: 0, // Button elevation
              ),
              child: const Text(
                'ك مسؤول',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
              height: 50,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(1500, 2, 152, 200), // Background color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.only(
                    left: 60, right: 60, top: 16, bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(50.0), // Button border radius
                ),
                elevation: 0, // Button elevation
              ),
              child: const Text(
                'ك ولي أمر',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
