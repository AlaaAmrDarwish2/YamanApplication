import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_auth/firebase_auth_services.dart';
import 'package:myapp/login_SignupAdmin/loginAdmin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'YOUR_API_KEY',
        appId: "YOUR_APP_ID",
        messagingSenderId: "YOUR_SENDER_ID",
        projectId: "YOUR_PROJECT_ID",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(AdminSignUpApp());
}

class AdminSignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إنشاء حساب مسؤول',
      initialRoute: '/',
      routes: {
        '/loginAdmin': (context) => const LoginAppAdmin(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminSignUpScreen(),
    );
  }
}

class AdminSignUpScreen extends StatefulWidget {
  @override
  _AdminSignUpScreenState createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreedToTerms = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'انشاء حساب',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(1500, 94, 95, 95),
                    ),
                  ),
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'البريد الإلكتروني',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(1500, 94, 95, 95),
                    ),
                  ),
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(1500, 94, 95, 95),
                    ),
                  ),
                  obscureText: true,
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'تأكيد كلمة المرور',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(1500, 94, 95, 95),
                    ),
                  ),
                  obscureText: true,
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: _agreedToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreedToTerms = value ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const Text('أوافق على الشروط والأحكام',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(1500, 2, 152, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  ),
                  child: const Text(
                    'إنشاء حساب',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginAdmin');
                  },
                  child: const Text(
                    'هل لديك حساب؟ سجل الدخول الآن',
                    style: TextStyle(
                      color: Color.fromARGB(1500, 2, 152, 200),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String emailAddress = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('خطأ'),
          content: Text('كلمة المرور وتأكيد كلمة المرور غير متطابقين.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('حسناً'),
            ),
          ],
        ),
      );
    } else {
      User? user = await _auth.signUpWithNameAndEmailAndPassword(
        username,
        emailAddress,
        password,
      );

      if (user != null) {
        print("تم إنشاء المستخدم بنجاح!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginAppAdmin()),
        );
      } else {
        print("حدث خطأ ما");
      }
    }
  }
}
