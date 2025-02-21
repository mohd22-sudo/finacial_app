
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Estate', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(22, 65, 24, 0.291),
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
        child: Center(
          child: Text(
            'Coming Soon...',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
