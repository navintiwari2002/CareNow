import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';
import '../../models/user_profile.dart';
import '../../services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _userService = UserService();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final user = _auth.currentUser;
    if (user == null) return;

    setState(() => _loading = true);

    final profile = await _userService.getUserProfile(user.uid);
    if (profile != null) {
      nameCtrl.text = profile.name;
      emailCtrl.text = profile.email;
      phoneCtrl.text = profile.phone;
      addressCtrl.text = profile.address;
    } else {
      emailCtrl.text = user.email ?? '';
    }

    setState(() => _loading = false);
  }

  Future<void> _updateUserProfile() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final profile = UserProfile(
      uid: user.uid,
      name: nameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      phone: phoneCtrl.text.trim(),
      address: addressCtrl.text.trim(),
    );

    await _userService.saveUserProfile(profile);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile updated")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/user_placeholder.png"),
          ),
          SizedBox(height: 20),
          TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Full Name")),
          TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: phoneCtrl, decoration: InputDecoration(labelText: "Phone")),
          TextField(controller: addressCtrl, decoration: InputDecoration(labelText: "Address")),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _updateUserProfile,
            child: Text("Update Profile"),
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
            child: Text("Settings & Security"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              backgroundColor: Colors.grey,
            ),
          ),
        ]),
      ),
    );
  }
}
