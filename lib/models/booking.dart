class Booking {
  final String userId;
  final String caretakerId;
  final String type; // Hourly, Daily, Weekly
  final String date;
  final String time;
  final String address;
  final String instructions;
  final double price;

  Booking({
    required this.userId,
    required this.caretakerId,
    required this.type,
    required this.date,
    required this.time,
    required this.address,
    required this.instructions,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'caretakerId': caretakerId,
      'type': type,
      'date': date,
      'time': time,
      'address': address,
      'instructions': instructions,
      'price': price,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      userId: map['userId'],
      caretakerId: map['caretakerId'],
      type: map['type'],
      date: map['date'],
      time: map['time'],
      address: map['address'],
      instructions: map['instructions'],
      price: map['price'].toDouble(),
    );
  }
}
