import 'package:flutter/material.dart';

class CaretakerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile'), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(radius: 40, backgroundColor: Colors.teal, child: Icon(Icons.person, size: 40, color: Colors.white)),
                SizedBox(height: 20),
                Text("Anita Sharma", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("anita@email.com"),
                Text("Phone: 9876543210"),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text("Edit Profile"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
