
import 'package:finacial_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor:Color.fromRGBO(22, 65, 24, 0.291),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(6, 48, 8, 160), Color.fromRGBO(0, 78, 91, 160)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('Account', style: TextStyle(color: Colors.white)),
                subtitle: Text('Manage your account details', style: TextStyle(color: Colors.white70)),
                onTap: () {},
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.white),
                title: Text('Privacy & Security', style: TextStyle(color: Colors.white)),
                subtitle: Text('Update your security settings', style: TextStyle(color: Colors.white70)),
                onTap: () {},
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.white),
                title: Text('Notifications', style: TextStyle(color: Colors.white)),
                subtitle: Text('Manage notification preferences', style: TextStyle(color: Colors.white70)),
                onTap: () {},
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.palette, color: Colors.white),
                title: Text('Appearance', style: TextStyle(color: Colors.white)),
                subtitle: Text('Customize app themes', style: TextStyle(color: Colors.white70)),
                onTap: () {},
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.help_outline, color: Colors.white),
                title: Text('Help & Support', style: TextStyle(color: Colors.white)),
                subtitle: Text('Get assistance and FAQs', style: TextStyle(color: Colors.white70)),
                onTap: () {},
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.redAccent),
                title: Text('Logout', style: TextStyle(color: Colors.redAccent)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
