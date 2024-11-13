import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_profile_screen.dart';
import 'user_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize UserController for dependency injection
    Get.put(UserController());

    return GetMaterialApp(
      title: 'User Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfileScreen(),
    );
  }
}
