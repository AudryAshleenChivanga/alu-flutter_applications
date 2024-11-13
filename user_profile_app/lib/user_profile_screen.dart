import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class UserProfileScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Input and Display
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => userController.changeName(value),
            ),
            SizedBox(height: 8),
            Obx(() => Text("Name: ${userController.name.value}", style: TextStyle(fontSize: 16))),

            SizedBox(height: 16),

            // Email Input and Display
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => userController.changeEmail(value),
            ),
            SizedBox(height: 8),
            Obx(() => Text("Email: ${userController.email.value}", style: TextStyle(fontSize: 16))),

            SizedBox(height: 16),

            // Age Input and Display
            TextField(
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                int age = int.tryParse(value) ?? 0;
                userController.changeAge(age);
              },
            ),
            SizedBox(height: 8),
            Obx(() => Text("Age: ${userController.age.value}", style: TextStyle(fontSize: 16))),

            SizedBox(height: 16),

            // Button to Save Data
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Success', 'User data updated!',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: Text('Update Information'),
            ),
          ],
        ),
      ),
    );
  }
}
