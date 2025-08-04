import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../../models/booking.dart';
import '../../services/firestore_service.dart';

class MyBookingsScreen extends StatefulWidget {
  @override
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final _auth = FirebaseAuth.instance;
  final _firestoreService = FirestoreService();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    if (user == null) {
      return Center(child: Text("Please login to see your bookings"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Ongoing'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: StreamBuilder<List<Booking>>(
        stream: _firestoreService.getUserBookings(user.uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final allBookings = snapshot.data!;

          // 🔄 Categorize by date
          final now = DateTime.now();
          final upcoming = allBookings.where((b) => DateTime.parse(b.date).isAfter(now)).toList();
          final past = allBookings.where((b) => DateTime.parse(b.date).isBefore(now)).toList();
          final ongoing = allBookings.where((b) => DateTime.parse(b.date).day == now.day).toList();

          return TabBarView(
            controller: _tabController,
            children: [
              _buildBookingList(upcoming, 'Upcoming'),
              _buildBookingList(ongoing, 'Ongoing'),
              _buildBookingList(past, 'Past'),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBookingList(List<Booking> bookings, String type) {
    if (bookings.isEmpty) {
      return Center(child: Text("No $type bookings"));
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (ctx, index) {
        final b = bookings[index];

        return Card(
          child: ListTile(
            title: Text("Type: ${b.type}"),
            subtitle: Text("Date: ${b.date}\nTime: ${b.time}\nAddress: ${b.address}"),
            trailing: type == 'Upcoming'
                ? PopupMenuButton<String>(
              onSelected: (val) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$val clicked")));
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: "Cancel", child: Text("Cancel")),
                PopupMenuItem(value: "Reschedule", child: Text("Reschedule")),
              ],
            )
                : Icon(Icons.check_circle, color: Colors.green),
          ),
        );
      },
    );
  }
}
