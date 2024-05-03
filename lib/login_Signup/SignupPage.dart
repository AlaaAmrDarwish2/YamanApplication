// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:myapp/login_Signup/login.dart';
// import 'package:flutter_application_8/login.dart';
// import 'DatabaseManager.dart'; // Import your DatabaseManager class

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
              textDirection: TextDirection.rtl,
            ),
            TextFormField(
              controller: _parentNameController,
              decoration: const InputDecoration(labelText: 'اسم الوالد'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
              keyboardType: TextInputType.emailAddress,
              textDirection: TextDirection.rtl,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
              textDirection: TextDirection.rtl,
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
              onChanged: (value) {
                // Implement checkbox logic
              },
            ),
            // Add other form fields for email, password, child details, etc.

            ElevatedButton(
              onPressed: () async {
                // if (_formKey.currentState!.validate()) {
                //   // If the form is valid, proceed with saving data
                //   Map<String, dynamic> userData = {
                //     'parentName': _parentNameController.text,
                //     'email': _emailController.text,
                //     'password': _passwordController.text,
                //     'childName': _childNameController.text,
                //     'childDOB': _childDOBController.text,
                //     'supervisoryAccess': _supervisoryAccess ? 1 : 0,
                //   };
                  // int userId =
                  // await DatabaseManager.insertUser(userData);

                  // After inserting, navigate to another page or perform an action
                  // For example, navigate to a success page or the login page
                  // Navigator.pushReplacementNamed(context, '/login');
                  // ignore: use_build_context_synchronously
                  // widget.onSignIn(_emailController.text.trim(),
                  //     _passwordController.text.trim());

                  // ignore: unnecessary_null_comparison
                  // if (_emailController != null) {
                  //   print("$_passwordController");
                  //   print("$_emailController");
                  // } else {
                  //   print("null");
                  // }
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        email: '$_emailController',
                        password: '$_passwordController',
                      ),
                    ),
                    // print(SnapshotController(userData[]['parentName']));
                  );
                
              },
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
}
