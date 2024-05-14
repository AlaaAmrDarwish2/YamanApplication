// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/HomeScreen.dart';
import 'package:myapp/firebase_auth/firebase_auth_services.dart';
import 'package:myapp/myBottomNavigationBar.dart';
// import 'package:myapp/login_Signup/login.dart';
// import 'package:flutter_application_8/login.dart';
// import 'DatabaseManager.dart'; // Import your DatabaseManager class

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
  runApp(const SignUpPage());
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'الحساب الشخصي',
    theme: ThemeData(
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/',
    routes: {
      '/HomeScreen': (context) => const HomeScreen(),
    },
    home: const SignUpPage(),
  );
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انشاء حساب'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SignUpForm(
            onSignIn: (String email, String password) {
              print('Signed in with email: $email, password: $password');
            },
          ),
        ),
      ), // Your signup form widget
    );
  }
}

class SignUpForm extends StatefulWidget {
  // const SignUpForm({super.key});
  final Function(String email, String password) onSignIn;

  const SignUpForm({Key? key, required this.onSignIn}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final FireBaseAuthService _auth = FireBaseAuthService();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _childNameController = TextEditingController();
  final TextEditingController _childDOBController = TextEditingController();
  // final bool _supervisoryAccess = false;

  @override
  void dispose() {
    _parentNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _childNameController.dispose();
    _childDOBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'بيانات ولي الأمر:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 152, 200)),
              // textDirection: TextDirection.rtl,
            ),
            TextFormField(
              controller: _parentNameController,
              decoration: const InputDecoration(labelText: 'اسم الوالد'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
              keyboardType: TextInputType.emailAddress,
              // textDirection: TextDirection.rtl,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
              // textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            const Text(
              'معلومات الطفل:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 152, 200)),
              textDirection: TextDirection.rtl,
            ),
            TextFormField(
              controller: _childNameController,
              decoration: const InputDecoration(labelText: 'اسم الطفل'),
              textDirection: TextDirection.rtl,
            ),
            TextFormField(
              controller: _childDOBController,
              decoration:
                  const InputDecoration(labelText: 'عمر الطفل/تاريخ الميلاد'),
              keyboardType: TextInputType.datetime,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            const Text(
              'الصلاحيات والأدوار:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 152, 200)),
              textDirection: TextDirection.rtl,
            ),
            CheckboxListTile(
              title: const Text('الوصول الإشرافي'),
              value: false, // Set value based on state management
              onChanged: (bool? value) {
                setState(() {
                  // _supervisoryAccess = value ?? false;
                });
              },
            ),
            // Add other form fields for email, password, child details, etc.

            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(1500, 2, 152, 200), // Background color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 16, bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(50.0), // Button border radius
                ),
                elevation: 0, // Button elevation
              ),
              child: const Text('انشاء حساب'),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String parentname = _parentNameController.text;
    String emailAddress = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signUpWithNameAndEmailAndPassword(parentname,emailAddress, password);

    if (user != null) {
      print("user is successfully created ! ");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyNav()),
      );
    } else {
      print("some error happend");
    }
  }
}
