import 'package:flutter/material.dart';

class AvailabilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Availability'), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(title: Text("Monday"), trailing: Switch(value: true, onChanged: (_) {})),
            ListTile(title: Text("Tuesday"), trailing: Switch(value: false, onChanged: (_) {})),
            ListTile(title: Text("Wednesday"), trailing: Switch(value: true, onChanged: (_) {})),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text("Save Availability"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal)),
          ],
        ),
      ),
    );
  }
}
