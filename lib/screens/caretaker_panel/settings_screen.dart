import 'package:flutter/material.dart';

class CaretakerSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.language), title: Text("Language"), onTap: () {}),
          ListTile(leading: Icon(Icons.notifications), title: Text("Notifications"), onTap: () {}),
          Divider(),
          ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Logout", style: TextStyle(color: Colors.red)), onTap: () {}),
        ],
      ),
    );
  }
}
