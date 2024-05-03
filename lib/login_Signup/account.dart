import 'package:flutter/material.dart';
// import 'DatabaseManager.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserDataScreenState createState() => _UserDataScreenState();
}
//https://github.com/AlaaAmrDarwish2/YamanApplication.git
class _UserDataScreenState extends State<UserDataScreen> {
  late Future<List<Map<String, dynamic>>> _userDataFuture;

  @override
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البيانات الشخصية'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Column(
                    children: [
                      Text(
                        'اسم الوالد: ${user['parentName']}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height:10,
                      ),
                      Text('اسم الطفل: ${user['childName']}',
                          textAlign: TextAlign.right ,style:const TextStyle(fontSize: 20),),
                      const SizedBox(
                        height:10,
                      ),
                    ],
                  ),
                  subtitle: Text(' ${user['email']}:الايميل ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                  ),

                  // Customize the way you want to display the data
                );
              },
            );
          }
        },
      ),
    );
  }
}
