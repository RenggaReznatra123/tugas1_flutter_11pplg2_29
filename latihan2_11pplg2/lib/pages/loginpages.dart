import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/loginpages_controler.dart';
import 'package:latihan2_11pplg2/reusable/custom_button.dart';
import 'package:latihan2_11pplg2/reusable/custom_textfield.dart';

class LoginPages extends StatelessWidget {
  LoginPages({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextField(
                controller: loginController.usernameController,
                myText: "Username",
                textColor: Colors.black,
                obscureText: false,
                isNumber: false,
              ),
              CustomTextField(
                controller: loginController.passwordController,
                myText: "Password",
                textColor: Colors.black,
                obscureText: true,
                isNumber: false,
              ),
              CustomButton(
                myText: "Login",
                textColor: Colors.white,
                onPressed: () {
                  loginController.login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
