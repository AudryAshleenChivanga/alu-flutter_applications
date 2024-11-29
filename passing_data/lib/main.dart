import 'package:flutter/material.dart';
import 'screens/first_screen.dart';  // Import the first screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(), // Set FirstScreen as the home screen
    );
  }
}
