import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/kalkulator.dart';
import 'package:latihan2_11pplg2/reusable/custom_textfield.dart';
import 'package:latihan2_11pplg2/reusable/custom_button.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';

class KalkulatorPages extends StatelessWidget {
  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  KalkulatorPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              myText: "Angka 1",
              controller: calculatorController.txtangka1,
              isNumber: true,
            ),
            CustomTextField(
              myText: "Angka 2",
              controller: calculatorController.txtangka2,
              isNumber: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    myText: "+",
                    onPressed: calculatorController.tambah,
                    textColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    myText: "-",
                    onPressed: calculatorController.kurang,
                    textColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    myText: "×",
                    onPressed: calculatorController.kali,
                    textColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    myText: "÷",
                    onPressed: calculatorController.bagi,
                    textColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Text(
                'Hasil: ${calculatorController.hasil.value}',
                style: const TextStyle(fontSize: 18),
              );
            }),
            const SizedBox(height: 20),
            CustomButton(
              myText: "Clear",
              onPressed: calculatorController.clear,
              textColor: Colors.white,
              backgroundColor: Colors.redAccent,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
