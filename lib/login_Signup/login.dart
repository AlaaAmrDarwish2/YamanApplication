import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:myapp/HomeScreen.dart';
import 'package:myapp/firebase_auth/firebase_auth_services.dart';
import 'package:myapp/forgetPassword.dart';
import 'package:myapp/login_Signup/account.dart';
import 'package:myapp/myBottomNavigationBar.dart';
// import 'package:myapp/myBottomNavigationBar.dart';
import 'SignupPage.dart';
// import 'package:myapp/login_Signup/DatabaseManager.dart';

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

  runApp(LoginPage(
    email: '',
    password: '',
  ));
}

class LoginPage extends StatelessWidget {
  // final int userId;

  const LoginPage({Key? key, required String email, required String password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SignInForm(),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  SignInForm({Key? key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // final _formKey = GlobalKey<FormState>();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CircleAvatar(
          radius: 100,
          backgroundColor: Color.fromARGB(1000, 4, 152, 200),
          backgroundImage: AssetImage('assets/img/page.png'),
        ),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'البريد الإلكتروني',
          ),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.visibility_sharp,
              color: Color.fromARGB(1500, 2, 152, 200),
            ),
            labelText: 'كلمة المرور',
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const Text('تذكرني'),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ForgotPasswordPage()),
              );
              
            },
            child: const Text('نسيت كلمة السر!'),
          ),
        ),
        const SizedBox(height: 20.0),
        // Display error message conditionally
        if (showError)
          const Text(
            'هنالك خطأ في البريد الالكتروني او كلمة السر ,انشئ حسابا ان لم يكن لديك',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.0,
            ),
          ),
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            elevation: 0,
          ),
          child: const Text('تسجيل الدخول'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
          },
          child: const Text('ليس لديك حساب؟! لٌلنُنشِئ حساباً جديداً'),
        ),
      ],
    );
  }

  void _login() async {
    // String parentname = _parentNameController.text;
    String emailAddress = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.loginWithEmailAndPassword(emailAddress, password);

    if (user != null) {
      print("user is successfully login ! ");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyNav()),
      );
    } else {
      print("some error happend");
    }
  }
}
