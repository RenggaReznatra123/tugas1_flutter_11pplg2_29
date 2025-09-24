import 'package:flutter/material.dart';
import 'package:latihan2_11pplg2/controller/splashscreen_contoller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text("Splash Screen"))),
    );
  }
}
