import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/edit_player_controller.dart';
import '../reusable/custom_textfield.dart';
import '../reusable/custom_button.dart';

class EditPlayerPages extends StatelessWidget {
  const EditPlayerPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditPlayerController());

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: controller
                      .playerController
                      .players[controller.index]
                      .image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              myText: "Nama Pemain",
              controller: controller.name,
              isNumber: false,
            ),
            CustomTextField(
              myText: "Nomor Punggung",
              controller: controller.number,
              isNumber: true,
            ),
            CustomTextField(
              myText: "Posisi",
              controller: controller.position,
              isNumber: false,
            ),
            const SizedBox(height: 20),
            CustomButton(myText: "Simpan", onPressed: controller.save),
          ],
        ),
      ),
    );
  }
}
