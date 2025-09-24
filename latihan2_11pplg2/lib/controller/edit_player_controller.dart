import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/football_player_model.dart';
import 'football_player_controller.dart';

class EditPlayerController extends GetxController {
  final name = TextEditingController();
  final number = TextEditingController();
  final position = TextEditingController();

  late int index;
  final playerController = Get.find<FootballPlayerController>();

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments as int;

    final player = playerController.players[index];
    name.text = player.name;
    number.text = player.number;
    position.text = player.position;
  }

  void save() {
    playerController.updatePlayer(
      index,
      FootballPlayer(
        name: name.text,
        number: number.text,
        position: position.text,
        image: playerController.players[index].image,
      ),
    );
    Get.back();
  }

  @override
  void onClose() {
    name.dispose();
    number.dispose();
    position.dispose();
    super.onClose();
  }
}
