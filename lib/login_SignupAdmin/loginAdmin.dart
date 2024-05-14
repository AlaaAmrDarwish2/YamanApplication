// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/HomeScreen.dart';
import 'package:myapp/firebase_auth/firebase_auth_services.dart';
import 'package:myapp/login_Signup/login.dart';
import 'package:myapp/login_SignupAdmin/signupAdmin.dart';
import 'package:myapp/myBottomNavigationBar.dart';
import 'package:myapp/myBottomNavigationBarAdmin.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyA3QHtrkb4efcW2D5ILfhOnPnQ6hAznhIw',
            appId: "1:1065969017070:web:92c82404068ed35aecd3ff",
            messagingSenderId: "1065969017070",
            projectId: "yaman-9026a"));
  }
  await Firebase.initializeApp();
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
        '/HomeScreen': (context) => const HomeScreen(),
        '/loginAdmin': (context) => const LoginAppAdmin(),
        '/signupAdmin': (context) => AdminSignUpApp(),
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
  final FireBaseAuthService _auth = FireBaseAuthService();
  // final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _childNameController = TextEditingController();
  // final TextEditingController _childDOBController = TextEditingController();
  bool showError = false;
  // final bool _supervisoryAccess = false;

  @override
  void dispose() {
    // _parentNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // _childNameController.dispose();
    // _childDOBController.dispose();
    super.dispose();
  }

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
          backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
          leading: null,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
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
                icon: const Icon(
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
            child: SingleChildScrollView(
              // Add SingleChildScrollView here
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
                  TextField(
                    style: const TextStyle(
                        fontSize: 16), // Increase font size of text fields
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      labelStyle: TextStyle(
                          fontSize: 16), // Increase font size of label
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: const TextStyle(
                        fontSize: 16), // Increase font size of text fields
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'كلمة المرور',
                      suffixIcon: Icon(
                        Icons.visibility_sharp,
                        color: Color.fromARGB(1500, 2, 152, 200),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 16), // Increase font size of label
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
                        activeColor: const Color.fromRGBO(2, 152, 200,
                            1), // Change the active color of the checkbox
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
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromRGBO(2, 152, 200, 1),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(1500, 255, 255,
                              255)), // Increase font size of button text
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
                      Navigator.pushNamed(context, '/signupAdmin');
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

  void _login() async {
    // String parentname = _parentNameController.text;
    String emailAddress = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.loginWithEmailAndPassword(emailAddress, password);

    if (user != null) {
      print("user is successfully signedin ! ");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyNavAdmin()),
      );
    } else {
      print("some error happend");
    }
  }
}
