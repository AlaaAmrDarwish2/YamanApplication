// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseManager {
//   static Database? _database;

//   static Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }

//   static Future<Database> initDatabase() async {
//     String path = await getDatabasesPath();
//     return openDatabase(
//       join(path, 'yamandatabase.db'),
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute('''
//           CREATE TABLE users(
//             id INTEGER PRIMARY KEY,
//             parentName TEXT,
//             email TEXT,
//             password TEXT,
//             childName TEXT,
//             childDOB TEXT,
//             supervisoryAccess INTEGER
//           )
//         ''');
//       },
//     );
//   }

//   static Future<int> insertUser(Map<String, dynamic> user) async {
//     final db = await database;
//     int userId = await db.insert('users', user);
//     return userId;

//   }

//   static Future<List<Map<String, dynamic>>> getAllUsers() async {
//     Database db = await database;
//     return await db.query(
//       'users',
//       columns: ['parentName', 'email', 'childName'],
//     );
//   }

//   static Future<bool> isUserInDatabase(String email, String password) async {
//     Database db = await database;

//     List<Map<String, dynamic>> users = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );

//     return users.isNotEmpty;
//   }

//   static Future<void> updateUser(String email, String newPassword) async {
//     try {
//       final db = await database;

//       await db.update(
//         'users',
//         {'password': newPassword},
//         where: 'email = ?',
//         whereArgs: [email],
//       );
//     } catch (e) {
//       print('Error updating user: $e');
//       // Handle the error as needed
//     }
//   }
//   static Future<Map<String, dynamic>?> fetchUserDataById(int userId) async {
//     try {
//       final db = await database;

//       List<Map<String, dynamic>> users = await db.query(
//         'users',
//         where: 'id = ?',
//         whereArgs: [userId],
//       );

//       if (users.isNotEmpty) {
//         return users.first;
//       } else {
//         return null; // User not found
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//       return null;
//     }
//   }
// }
