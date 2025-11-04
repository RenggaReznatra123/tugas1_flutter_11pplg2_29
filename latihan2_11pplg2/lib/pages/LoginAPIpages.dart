import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/LoginAPIcontroller.dart';

class LoginAPIPage extends StatelessWidget {
  const LoginAPIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginAPIController>();

    TextEditingController userC = TextEditingController();
    TextEditingController passC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login API")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userC,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passC,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        controller.login(userC.text, passC.text);
                      },
                      child: const Text("Login"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
