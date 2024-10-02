import 'package:events_attendance/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'TechFestOverviewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        scaffoldBackgroundColor: Color(0xFF0A0E21), // Dark blue-black color

        primaryColor: Color(0xFF1C2A48), // Dark blue for primary elements
        hintColor: Color(0xFF0ACDFF), // Bright blue for highlights

        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white70), // Subtle white text
        ),

        // Button theme for uniformity
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF0ACDFF), // Bright blue button
          textTheme: ButtonTextTheme.primary,
        ),

        // App bar styling
        appBarTheme: AppBarTheme(
          color: Colors.indigo.shade900,
          toolbarTextStyle: TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20),
          ).bodyMedium,
          titleTextStyle: TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20),
          ).titleLarge,
        ),

        // TextField Input Decoration
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1C2A48), // Dark blue background for input fields
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF0ACDFF),
                width: 2.0), // Bright blue border on focus
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white70,
                width: 1.5), // White border for idle state
          ),
          labelStyle: TextStyle(color: Colors.white70),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("techFest'24"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/techFest_logo.png', // Path to the image
              width: 36, // Width of the image
              height: 36, // Height of the image
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TechFestOverviewPage(),
                  ),
                );
              },
              child: Text(
                'Log In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


