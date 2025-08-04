import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {"title": "Booking Confirmed", "desc": "Your caretaker booking has been confirmed.", "time": "10 mins ago"},
    {"title": "Offer: 20% OFF", "desc": "Get 20% off on weekly bookings this month!", "time": "1 hour ago"},
    {"title": "Caretaker On the Way", "desc": "Your caretaker is on the way.", "time": "Yesterday"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (ctx, index) {
          final n = notifications[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.notifications_active, color: Colors.teal),
              title: Text(n['title'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(n['desc']),
              trailing: Text(n['time'], style: TextStyle(fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}
