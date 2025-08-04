import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Details"), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Client: Ravi Kumar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Date: 24 June 2025"),
                Text("Time: 10:00 AM - 2:00 PM"),
                Text("Location: Delhi"),
                Text("Service: Elderly Care"),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text("Mark as Completed"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
