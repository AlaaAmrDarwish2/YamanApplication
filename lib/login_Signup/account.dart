import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:myapp/login_Signup/account.dart';
// import 'package:myapp/firebase_auth/firebase_auth_services.dart';
import 'package:myapp/login_Signup/login.dart';
// import 'package:myapp/myBottomNavigationBar.dart';

void main() {
  runApp(const account());
}

class account extends StatelessWidget {
  const account({super.key});

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
        '/login': (context) => const LoginPage(
              email: '',
              password: '',
            ),
      },
      home: AccountPage(),
    );
  }
}

User? user = FirebaseAuth.instance.currentUser;
String? userEmail = user?.email ?? 'No email found';
String? userName = user?.displayName ?? 'No name found';
// String? userName = user?.user ?? 'No username found';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 2, 152, 200),
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        title: const Text(
          'الحساب الشخصي',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                // Handle avatar tap action
              },
              child: Stack(
                children: [
                  Container(
                    // width: 150,
                    // height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color.fromARGB(255, 2, 152, 200),
                          width: 4),
                    ),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/img/page.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(
                            255, 2, 152, 200), // تغيير لون دائرة الأيقونة هنا
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () {
                          // Handle camera tap action
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              userName!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(1500, 2, 152, 200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              userEmail!,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(1500, 2, 152, 200),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Handle change password action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 16, bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 0,
              ),
              child: const Text(
                'تغيير كلمة المرور',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage(email: '', password: '',)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(1500, 2, 152, 200),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                    left: 55, right: 55, top: 16, bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 0,
              ),
              child: const Text(
                'تسجيل الخروج',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
