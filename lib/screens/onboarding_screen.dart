import 'package:finacial_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {"title": "Invest Smartly", "subtitle": "Gain insights on stocks and trade with confidence.", "bgColor": [Color.fromRGBO(6, 48, 8, 180), Color.fromRGBO(0, 78, 91, 180)]},
    {"title": "Track Your Portfolio", "subtitle": "Monitor your investments in real-time.", "bgColor": [Color.fromRGBO(6, 48, 8, 255), Color.fromRGBO(0, 78, 91, 255)]},
    {"title": "Secure Transactions", "subtitle": "Your data and money are safe with us.", "bgColor": [Color.fromRGBO(6, 48, 8, 180), Color.fromRGBO(0, 78, 91, 180)]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(
                context,
                _pages[index]['title'],
                _pages[index]['subtitle'],
                _pages[index]['bgColor'],
                index == _pages.length - 1,
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: _currentIndex == index ? 12 : 8,
                  height: _currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.white : Colors.white38,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, String title, String subtitle, List<Color> bgColor, bool isLastPage) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(6, 48, 8, 180), Color.fromRGBO(0, 78, 91, 180)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 10),
          Text(subtitle, style: const TextStyle(fontSize: 16, color: Colors.white70), textAlign: TextAlign.center),
          const SizedBox(height: 40),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) => AuthScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 12, 76, 41),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
