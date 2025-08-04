import 'package:flutter/material.dart';

class CaretakerNotificationsScreen extends StatelessWidget {
  final List<String> dummyNotifications = [
    "You have a new booking request.",
    "Your profile has been approved.",
    "Reminder: Set your availability for this week.",
    "System maintenance on Sunday, 10 PM.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: dummyNotifications.isEmpty
            ? Center(
          child: Text(
            'No notifications yet.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        )
            : ListView.builder(
          itemCount: dummyNotifications.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.teal),
                title: Text(
                  dummyNotifications[index],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
