import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  // Reactive variables for user information
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxInt age = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  // Method to load saved user data from shared preferences
  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
    age.value = prefs.getInt('age') ?? 0;
  }

  // Method to update the user's name
  void changeName(String newName) async {
    name.value = newName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', newName);
  }

  // Method to update the user's email
  void changeEmail(String newEmail) async {
    email.value = newEmail;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', newEmail);
  }

  // Method to update the user's age
  void changeAge(int newAge) async {
    age.value = newAge;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('age', newAge);
  }
}
