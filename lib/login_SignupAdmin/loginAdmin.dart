// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/HomeScreen.dart';
import 'package:myapp/login_Signup/login.dart';
import 'package:myapp/myBottomNavigationBar.dart';
import 'package:myapp/myBottomNavigationBarAdmin.dart';

void main() {
  runApp(const LoginAppAdmin());
}

class LoginAppAdmin extends StatelessWidget {
  const LoginAppAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تسجيل الدخول',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(email: '', password: ''),
        '/myBottomNavigationBarAdmin': (context) => const MyNavAdmin(),
        '/myBottomNavigationBar': (context) => const MyNav(),
        '/HomeScreen':(context) => const HomeScreen(),
        '/loginAdmin': (context) => const LoginAppAdmin(),
      },
      home: const AdminLoginPage(),
      debugShowCheckedModeBanner: false, // Add this line
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        return false; // Returning false prevents back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const  Color.fromARGB(1500, 2, 152, 200),
          leading: null,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight:
                  Radius.circular(50))), 
                      // Remove the leading icon
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                width: 63,
              ),
              IconButton(
                icon:const  Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add action for the back arrow
                },
              ),
            ],
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView( // Add SingleChildScrollView here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('./assets/img/page.png'),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    style: TextStyle(fontSize: 16), // Increase font size of text fields
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      labelStyle: TextStyle(fontSize: 16), // Increase font size of label
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    style: TextStyle(fontSize: 16), // Increase font size of text fields
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      suffixIcon: Icon(Icons.visibility_sharp , color: Color.fromARGB(1500, 2, 152, 200),),
                      labelStyle: TextStyle(fontSize: 16), // Increase font size of label
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        activeColor: const Color.fromRGBO(2, 152, 200, 1), // Change the active color of the checkbox
                      ),
                      const Text(
                        'تذكرني',
                        style: TextStyle(
                          fontSize: 16, // Increase font size of text
                          color: Color.fromRGBO(94, 95, 95, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/myBottomNavigationBarAdmin');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), 
                      backgroundColor:const Color.fromRGBO(2, 152, 200, 1),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)
                    ),
                    child:const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 24 , color: Color.fromARGB(1500, 255, 255, 255)), // Increase font size of button text
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add action for 'نسيت كلمة المرور' link
                        },
                        child: const Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(
                            color: Color.fromRGBO(94, 95, 95, 1),
                            fontSize: 18, // Increase font size of text
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Add action for 'ليس لديك حساب؟ لننشئ حساباً جديداً'
                      // Replace the print statement with the desired action
                      // ignore: avoid_print
                      print('Navigate to sign up screen');
                    },
                    child: const Text(
                      'ليس لديك حساب؟ لننشئ حساباً جديداً',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18, // Increase font size of text
                        color: Color.fromRGBO(94, 95, 95, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
