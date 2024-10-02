import 'dart:async'; // For timer
import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      duration: Duration(seconds: 2), // 2-second animation duration
      vsync: this,
    );

    // Tween from 0 to 1 (for fading in the image)
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Start the animation
    _animationController.forward();

    // Timer to navigate to the main screen after the animation
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: "techFest'24")),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21), // Dark theme background
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/images/techFest_logo.png', // Replace with your image path
            width: 200, // Image size
            height: 200,
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechFest Main Screen'),
      ),
      body: Center(
        child: Text('Welcome to TechFest 2024!'),
      ),
    );
  }
}
