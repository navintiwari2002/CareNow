import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../routes/app_routes.dart';

class RoleRedirectScreen extends StatefulWidget {
  @override
  _RoleRedirectScreenState createState() => _RoleRedirectScreenState();
}

class _RoleRedirectScreenState extends State<RoleRedirectScreen> {
  @override
  void initState() {
    super.initState();
    handleRedirect();
  }

  Future<void> handleRedirect() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Not logged in
      Navigator.pushReplacementNamed(context, AppRoutes.login);
      return;
    }

    final uid = user.uid;

    try {
      // 🔎 Try to get user from "caretakers" first
      DocumentSnapshot caretakerDoc = await FirebaseFirestore.instance
          .collection('caretakers')
          .doc(uid)
          .get();

      if (caretakerDoc.exists && caretakerDoc['role'] == 'caretaker') {
        Navigator.pushReplacementNamed(context, AppRoutes.caretakerDashboard);
        return;
      }

      // 👤 Try to get from "users" collection
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists && userDoc['role'] == 'user') {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        return;
      }

      // 🛑 No matching role found
      Navigator.pushReplacementNamed(context, AppRoutes.login);

    } catch (e) {
      print("Error during role check: $e");
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // Waiting animation
    );
  }
}
