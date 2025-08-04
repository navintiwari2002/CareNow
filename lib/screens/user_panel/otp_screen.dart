import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class OTPScreen extends StatelessWidget {
  final otpCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌈 Gradient Background Container
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFFFFE0B2)], // Light Blue to Peach
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("OTP Verification",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    )),
                SizedBox(height: 10),
                Text("Enter the 6-digit code sent to your number",
                    style: TextStyle(fontSize: 16, color: Colors.black54)),

                SizedBox(height: 30),

                // 🔢 OTP Field
                TextField(
                  controller: otpCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter OTP",
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),

                SizedBox(height: 20),

                // ✅ Verify Button
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.home),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Verify", style: TextStyle(fontSize: 16)),
                ),

                SizedBox(height: 16),

                // 🔁 Resend Option (optional)
                Center(
                  child: TextButton(
                    onPressed: () {
                      // TODO: Resend OTP logic
                    },
                    child: Text("Didn't receive OTP? Resend",
                        style: TextStyle(color: Colors.deepOrange)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
