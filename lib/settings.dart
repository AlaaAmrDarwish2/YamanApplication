import 'package:flutter/material.dart';

void main() {
  runApp(settings());
}

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'Arabic';
  String _selectedFontSize = 'Medium';
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Language'),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: <String>['English', 'Arabic'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Font Size'),
            DropdownButton<String>(
              value: _selectedFontSize,
              items: <String>['Small', 'Medium', 'Large', 'Extra Large']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFontSize = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: _isDarkMode,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isDarkMode = newValue;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.blue,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white54,
      //   currentIndex: 4, // Index of the "Settings" tab
      //   items: [
      //      BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.video_collection),
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //     ),
      //   ],
      // ),
    );
  }
}
