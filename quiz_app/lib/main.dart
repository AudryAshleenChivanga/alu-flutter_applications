import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX package
import 'package:quiz_app/quiz/Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp for GetX
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple, // Purplish theme
        scaffoldBackgroundColor: const Color(0xfff3e5f5), // Light purple background
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xff512da8),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          bodyLarge: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      home: const QuizSplashScreen(),
    );
  }
}
