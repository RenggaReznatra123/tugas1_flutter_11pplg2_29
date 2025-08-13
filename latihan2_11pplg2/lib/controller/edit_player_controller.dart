import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/football_player_model.dart';
import 'football_player_controller.dart';

class EditPlayerController extends GetxController {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final positionController = TextEditingController();

  late int playerIndex;
  late FootballPlayer originalPlayer;

  void setPlayer(FootballPlayer player, int index) {
    originalPlayer = player;
    playerIndex = index;

    nameController.text = player.name;
    numberController.text = player.number;
    positionController.text = player.position;
  }

  void saveChanges() {
    final updatedPlayer = FootballPlayer(
      name: nameController.text,
      number: numberController.text,
      position: positionController.text,
      image: originalPlayer.image,
    );

    Get.find<FootballPlayerController>().updatePlayer(
      playerIndex,
      updatedPlayer,
    );
    Get.back();
  }
}
