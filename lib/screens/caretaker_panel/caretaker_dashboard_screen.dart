import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart'; // Make sure this path is correct

class CaretakerDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'Bookings',
        'icon': Icons.assignment,
        'route': AppRoutes.caretakerBookings
      },
      {
        'title': 'Availability',
        'icon': Icons.access_time,
        'route': AppRoutes.caretakerAvailability
      },
      {
        'title': 'Profile',
        'icon': Icons.person,
        'route': AppRoutes.caretakerProfile
      },
      {
        'title': 'Chat',
        'icon': Icons.chat,
        'route': AppRoutes.caretakerChat
      },
      {
        'title': 'Support',
        'icon': Icons.support_agent,
        'route': AppRoutes.caretakerSupport
      },
      {
        'title': 'Settings',
        'icon': Icons.settings,
        'route': AppRoutes.caretakerSettings
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Caretaker Dashboard'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: features.map((feature) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, feature['route']);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                elevation: 4,
                shadowColor: Colors.teal.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(feature['icon'], size: 40, color: Colors.teal),
                    SizedBox(height: 10),
                    Text(
                      feature['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
