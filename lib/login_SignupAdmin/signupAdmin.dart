import 'package:flutter/material.dart';

void main() {
  runApp(AdminSignUpApp());
}

class AdminSignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إنشاء حساب مسؤول',
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
           shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight:
                  Radius.circular(50))),
          backgroundColor: const Color.fromARGB(1500, 2, 152, 200), // Set background color to white
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color.fromARGB(1500, 255, 255, 255)), // Arrow back
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                width: 90,
              ),
              const Text(
                'انشاء حساب',
                style: TextStyle(
                  color: Colors.white, // Set title text color to black
                  fontSize: 24, // Set font size
                  fontWeight: FontWeight.normal, // Set font weight to bold
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم',
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 152, 200)),
                    ),
                    labelStyle: TextStyle(fontSize: 16,
                        color:
                            Color.fromARGB(1500, 94, 95, 95)), // Set font size
                  ),
                  cursorColor: const Color.fromARGB(1500, 2, 152, 200),
                  style: const TextStyle(fontSize: 20), // Set font size
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'البريد الإلكتروني',
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 152, 200)),
                    ),
                    labelStyle: TextStyle(fontSize: 16,
                        color:
                            Color.fromARGB(1500, 94, 95, 95)), // Set font size
                  ),
                  cursorColor: const Color.fromARGB(1500, 2, 152, 200),
                  style: const TextStyle(fontSize: 16), // Set font size
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 152, 200)),
                    ),
                    labelStyle: TextStyle(fontSize: 16 ,
                        color:
                            Color.fromARGB(1500, 94, 95, 95)), // Set font size
                  ),
                  obscureText: true,
                  cursorColor: const Color.fromARGB(1500, 2, 152, 200),
                  style: const TextStyle(fontSize: 16), // Set font size
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'تأكيد كلمة المرور',
                    labelStyle:
                    TextStyle(fontSize: 16  , color: Color.fromARGB(1500, 94, 95, 95)),
                    focusColor:Color.fromARGB(1500, 2, 152, 200), 
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 2, 152, 200)),
                    ),
                     // Set font size
                  ),
                  obscureText: true,
                  cursorColor: const Color.fromARGB(1500, 2, 152, 200),
                  style: const TextStyle(fontSize: 16), // Set font size
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
                      activeColor: const Color.fromRGBO(2, 152, 200, 1), // Set color when checked
                    ),
                    const Text('أوافق على الشروط والأحكام', style: TextStyle(fontSize: 16) ), // Set font size
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: (){},
                  child:  Text(
                    'إنشاء حساب',
                    style: TextStyle(fontSize: 20 , color: Color.fromARGB(1500, 255, 255, 255)), // Set font size
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(2, 152, 200, 1), // Set button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Set border radius
                    ),
                    padding:const  EdgeInsets.fromLTRB(0, 10, 0, 10)
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    // Navigate to login page
                  },
                  child: const Text(
                    'هل لديك حساب؟ سجل الدخول الآن',
                    style: TextStyle(
                      color: Color.fromRGBO(2, 152, 200, 1), // Set text color
                      fontSize: 18, // Set font size
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

  void _submit() {
    // Perform sign up actions here
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Example: Print sign up details
    print('اسم المستخدم: $username');
    print('البريد الإلكتروني: $email');
    print('كلمة المرور: $password');
  }
}
