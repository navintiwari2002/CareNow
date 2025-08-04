import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  void handleLogout(BuildContext context) async {
    await AuthService().logout(); // ✅ Sign out user
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
          (route) => false, // ✅ Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings & Security")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text("Change Password"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Change Password"),
                  content: Text("This is where password change UI will go."),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text("Close")),
                  ],
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Logout"),
                  content: Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel")),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        handleLogout(context);   // ✅ Logout function
                      },
                      child: Text("Logout"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
