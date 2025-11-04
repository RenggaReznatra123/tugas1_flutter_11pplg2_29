import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/example_controller.dart';
import 'package:latihan2_11pplg2/pages/example/examplemobile.dart';
import 'package:latihan2_11pplg2/pages/example/exampletab.dart';

class ExampleTransform extends StatelessWidget {
  ExampleTransform({super.key});

  final ExampleController controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value ? Examplemobile() : ExampleTab(),
          );
        },
      ),
    );
  }
}
