import 'package:finacial_app/screens/home_screen.dart';
import 'package:finacial_app/screens/real_estate_screen.dart';
import 'package:finacial_app/screens/portfolio_screen.dart';
import 'package:finacial_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    
    NewsScreen(),
    PortfolioScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
  
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Color.fromARGB(255, 33, 56, 44),
            selectedItemColor: Color.fromARGB(247, 8, 17, 13),
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Stocks'),
              
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Real Estate'),
              BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Portfolio'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
