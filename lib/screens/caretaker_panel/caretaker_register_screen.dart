import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CaretakerRegisterScreen extends StatefulWidget {
  @override
  State<CaretakerRegisterScreen> createState() => _CaretakerRegisterScreenState();
}

class _CaretakerRegisterScreenState extends State<CaretakerRegisterScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool loading = false;

  Future<void> registerCaretaker() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty ||
        passwordCtrl.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields correctly')),
      );
      return;
    }

    try {
      setState(() => loading = true);
      print("Attempting to register user...");

      // Step 1: Register with Firebase Auth
      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );

      String uid = userCred.user!.uid;
      print("User registered with UID: $uid");

      // Step 2: Save additional info to Firestore
      try {
        await FirebaseFirestore.instance.collection('caretakers').doc(uid).set({
          'uid': uid,
          'name': nameCtrl.text.trim(),
          'email': emailCtrl.text.trim(),
          'phone': phoneCtrl.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        print("Caretaker data saved to Firestore!");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful')),
        );

        // Optional: Clear the form or navigate
        nameCtrl.clear();
        emailCtrl.clear();
        phoneCtrl.clear();
        passwordCtrl.clear();
      } catch (firestoreError) {
        print("Error saving to Firestore: $firestoreError");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error saving to Firestore")),
        );
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth error: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
      );
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as Caretaker'), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Icon(Icons.person_add, size: 60, color: Colors.teal),
            SizedBox(height: 20),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: phoneCtrl,
              decoration: InputDecoration(
                labelText: 'Phone',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : registerCaretaker,
              child: loading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Register"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
