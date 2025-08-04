import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class ConfirmationScreen extends StatelessWidget {
  final bookingId = "CN-123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Confirmed")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 20),
              Text("Thank you!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Your booking is confirmed."),
              SizedBox(height: 10),
              Text("Booking ID: $bookingId", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
                },
                child: Text("Back to Home"),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
