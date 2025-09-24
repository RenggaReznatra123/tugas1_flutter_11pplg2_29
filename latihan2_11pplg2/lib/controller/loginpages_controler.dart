import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login() async {
    if (usernameController.text.toString() == "admin" &&
        passwordController.text.toString() == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.calculatorPage);
      Get.snackbar("Login", "Login Successful");
    } else {
      Get.snackbar("Error", "invalid username or password");
    }
  }
}
