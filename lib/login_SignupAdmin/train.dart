// import 'package:flutter/material.dart';
// import 'package:myapp/myBottomNavigationBar.dart';
// import 'package:myapp/login_Signup/SignupPage.dart';


// void main() {
//   runApp(const LoginPage());
// }

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تسجيل الدخول'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SignInForm(),
//         ),
//       ),
//     );
//   }
// }

// class SignInForm extends StatefulWidget {
//   SignInForm({Key? key}) : super(key: key);

//   @override
//   _SignInFormState createState() => _SignInFormState();
// }

// class _SignInFormState extends State<SignInForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool showError = false;

//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'البريد الإلكتروني مطلوب';
//     }
//     if (!RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value)) {
//       return 'البريد الإلكتروني غير صالح';
//     }
//     return null;
//   }

//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'كلمة المرور مطلوبة';
//     }
//     if (value.length < 6) {
//       return 'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const CircleAvatar(
//             radius: 100,
//             backgroundColor: Color.fromARGB(1000, 4, 152, 200),
//             backgroundImage: AssetImage('assets/img/page.png'),
//           ),
//           TextFormField(
//             controller: emailController,
//             decoration: const InputDecoration(
//               labelText: 'البريد الإلكتروني',
//             ),
//             validator: validateEmail,
//           ),
//           const SizedBox(height: 20.0),
//           TextFormField(
//             controller: passwordController,
//             obscureText: true,
//             decoration: const InputDecoration(
//               labelText: 'كلمة المرور',
//               suffixIcon: Icon(Icons.visibility),
//             ),
//             validator: validatePassword,
//           ),
//           const SizedBox(height: 10.0),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const MyNav(),
//                   ),
//                 );
//               } else {
//                 setState(() {
//                   showError = true;
//                 });
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50.0),
//               ),
//             ),
//             child: const Text('تسجيل الدخول'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SignUpPage()),
//               );
//             },
//             child: const Text('ليس لديك حساب؟! لٌلنُنشِئ حساباً جديداً'),
//           ),
//         ],
//       ),
//     );
//   }
// }