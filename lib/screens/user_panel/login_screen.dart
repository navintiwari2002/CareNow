import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController(); // optional UI field
  final passwordCtrl = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  void handleLogin() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final user = await AuthService().login(emailCtrl.text.trim(), passwordCtrl.text.trim());

    if (user != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.otp); // or AppRoutes.home after verification
    } else {
      setState(() {
        errorMessage = "Login failed. Check your email/password.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌈 Gradient Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFFFFE0B2)], // Light blue to peach
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back 👋",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      )),
                  SizedBox(height: 10),
                  Text("Login or Sign up to continue",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                  SizedBox(height: 30),

                  // 🌟 Input Fields
                  _buildInputField("Email", emailCtrl, Icons.email_outlined),
                  _buildInputField("Phone", phoneCtrl, Icons.phone),
                  _buildInputField("Password", passwordCtrl, Icons.lock_outline, isPassword: true),
                  SizedBox(height: 20),

                  if (errorMessage != null)
                    Text(errorMessage!,
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),

                  // 🚀 Login Button
                  ElevatedButton(
                    onPressed: isLoading ? null : handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: isLoading
                        ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : Text("Continue", style: TextStyle(fontSize: 16)),
                  ),

                  SizedBox(height: 20),
                  Center(child: Text("Or login with", style: TextStyle(color: Colors.grey[700]))),

                  // 🟢 Social Buttons
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Icons.g_mobiledata, Colors.red, "Google login"),
                      SizedBox(width: 16),
                      _socialButton(Icons.apple, Colors.black, "Apple login"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, Color color, String tooltip) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.9),
      radius: 24,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {
          // TODO: Implement social login
        },
        tooltip: tooltip,
      ),
    );
  }
}
