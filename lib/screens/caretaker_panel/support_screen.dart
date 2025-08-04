import 'package:flutter/material.dart';

class CaretakerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Support"), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text("Call Support"),
              subtitle: Text("1800-123-4567"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.teal),
              title: Text("Email Support"),
              subtitle: Text("support@carenow.com"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
