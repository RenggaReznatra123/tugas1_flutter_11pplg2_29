import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/football_player_controller.dart';
import 'football_mobile.dart';
import 'football_tab.dart';

class FootballTransform extends StatelessWidget {
  FootballTransform({super.key});

  final FootballPlayerController controller = Get.put(
    FootballPlayerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? const FootballMobile()
                : const FootballTab(),
          );
        },
      ),
    );
  }
}
