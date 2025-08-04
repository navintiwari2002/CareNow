import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';
import '../../models/booking.dart';
import '../../services/firestore_service.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedService = 'Hourly';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final addressCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  void _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        setState(() {
          selectedDate = date;
          selectedTime = time;
        });
      }
    }
  }

  void handleBookingConfirm() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please login again.")),
      );
      return;
    }

    if (selectedDate == null || selectedTime == null || addressCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all booking details.")),
      );
      return;
    }

    // Generate a formatted date and time
    String formattedDate = selectedDate!.toIso8601String().split("T")[0];
    String formattedTime = selectedTime!.format(context);

    // Set price based on service type (example logic)
    double price = selectedService == 'Hourly'
        ? 300
        : selectedService == 'Daily'
        ? 1500
        : 4000;

    final booking = Booking(
      userId: user.uid,
      caretakerId: 'abc123', // In future: get this from Caretaker screen
      type: selectedService,
      date: formattedDate,
      time: formattedTime,
      address: addressCtrl.text.trim(),
      instructions: noteCtrl.text.trim(),
      price: price,
    );

    try {
      await FirestoreService().saveBooking(booking);
      Navigator.pushNamed(context, AppRoutes.confirmation);
    } catch (e) {
      print("Booking error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to book. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Caretaker")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Select Service Type", style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 10,
            children: ['Hourly', 'Daily', 'Weekly'].map((type) {
              return ChoiceChip(
                label: Text(type),
                selected: selectedService == type,
                onSelected: (_) => setState(() => selectedService = type),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text("Choose Date & Time", style: TextStyle(fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: _pickDateTime,
            child: Text(selectedDate == null
                ? "Select"
                : "${selectedDate!.toLocal().toString().split(' ')[0]} @ ${selectedTime?.format(context)}"),
          ),
          SizedBox(height: 20),
          Text("Enter Address", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: addressCtrl, decoration: InputDecoration(hintText: "Address")),
          SizedBox(height: 20),
          Text("Special Instructions", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: noteCtrl, maxLines: 3, decoration: InputDecoration(hintText: "Any specific needs?")),
          SizedBox(height: 20),
          Text("Estimated Price", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            selectedService == 'Hourly'
                ? "₹300"
                : selectedService == 'Daily'
                ? "₹1500"
                : "₹4000",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: handleBookingConfirm,
            child: Text("Confirm & Book"),
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          )
        ]),
      ),
    );
  }
}
