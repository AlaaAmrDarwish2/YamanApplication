import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:myapp/login_Signup/account.dart';
// import 'package:myapp/login_Signup/account.dart';
// import 'package:myapp/firebase_auth/firebase_auth_services.dart';
import 'package:myapp/login_Signup/login.dart';
// import 'package:myapp/myBottomNavigationBar.dart';

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
  runApp(const accountUser());
}

class accountUser extends StatelessWidget {
  const accountUser({super.key});

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
// String? globalImageUrl;

// void updateImageUrl(String imageUrl) {
//   globalImageUrl = imageUrl;
// }

//String? userName = user?.user ?? 'No username found';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  File? _selectedImage;
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
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : AssetImage('./assets/img/page.png')
                              as ImageProvider,
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
                          _pichImageFromGallery();
                          // uploadToFirebase();
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
                setState(() {
                  user = null;
                  userEmail = 'No email found';
                  userName = 'No name found';
                });
                FirebaseAuth.instance.authStateChanges();
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage(
                              email: '',
                              password: '',
                            )));
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

  Future _pichImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  // Future<String> uploadFile(File image) async {
  //   String downloadURL;
  //   String postId = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child("images")
  //       .child("post_$postId.jpg");
  //   await ref.putFile(image);
  //   downloadURL = await ref.getDownloadURL();
  //   return downloadURL;
  // }

  // Future<String> uploadFile(File image) async {
  //   try {
  //     String postId = DateTime.now().millisecondsSinceEpoch.toString();
  //     Reference ref = FirebaseStorage.instance
  //         .ref()
  //         .child("images")
  //         .child("post_$postId.jpg");
  //     await ref.putFile(image);
  //     String downloadURL = await ref.getDownloadURL();
  //     return downloadURL;
  //   } catch (e) {
  //     // Handle error (e.g., log error, show error message)
  //     print("Error uploading file: $e");
  //     // Return a default value or re-throw the error
  //     // return null;
  //     throw e; // Rethrow the error
  //   }
  // }

  // uploadToFirebase() async {
  //   try {
  //     // Upload the image to Firebase Storage
  //     String imageUrl = await uploadFile(_selectedImage!);

  //     // Update the user document in Firestore with the image URL
  //     await FirebaseFirestore.instance.collection('users').doc(uid).update({
  //       'imageUrl': imageUrl,
  //     });

  //     // Update the globalImageUrl variable
  //     updateImageUrl(imageUrl);
  //   } catch (e) {
  //     print("Error uploading image and updating user document: $e");
  //     // Handle the error (e.g., show error message to user)
  //   }
  // }

  // uploadToFirebase() async {
  //   try {
  //     String url = await uploadFile(_selectedImage!);
  //     await FirebaseFirestore.instance.collection('users').doc(uid).update({
  //       'url': url,
  //     });
  //   } catch (e) {
  //     print("Error uploading file to Firebase: $e");
  //     // Handle the error (e.g., show error message to user)
  //   }
  // }

  // uploadToFirebase() async {
  //   String url = await uploadFile(
  //       _selectedImage!); // this will upload the file and store url in the variable 'url'
  //   await FirebaseFirestore.instance.collection('users').doc(uid).update({
  //     //use update to update the doc fields.
  //     'url': url
  //   });
  // }
}
