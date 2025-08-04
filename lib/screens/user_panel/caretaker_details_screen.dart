import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class CaretakerDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Caretaker Details")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/images/user1.png"))),
          SizedBox(height: 10),
          Center(child: Text("Rita Sharma", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          Text("Experience: 5 years\nBio: Certified nurse with experience in elderly care."),
          SizedBox(height: 10),
          Text("Availability:", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Mon - Sat • 9am to 6pm"),
          SizedBox(height: 10),
          Text("Rates:", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Hourly: ₹300\nDaily: ₹1800\nWeekly: ₹10000"),
          SizedBox(height: 10),
          Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("⭐️⭐️⭐️⭐️  (120 Reviews)"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.booking),
            child: Text("Book Now"),
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          ),
        ]),
      ),
    );
  }
}
