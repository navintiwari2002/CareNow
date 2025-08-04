import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  // 🔽 Save a booking
  Future<void> saveBooking(Booking booking) async {
    await _db.collection('bookings').add(booking.toMap());
  }

  // 🔽 Fetch bookings for a user
  Stream<List<Booking>> getUserBookings(String userId) {
    return _db
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Booking.fromMap(doc.data()))
        .toList());
  }
}
