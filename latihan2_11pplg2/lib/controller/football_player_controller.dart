import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/football_player_model.dart';

class FootballPlayerController extends GetxController {
  var players = <FootballPlayer>[].obs;

  @override
  void onInit() {
    players.addAll([
      FootballPlayer(
        name: 'Ronaldo',
        number: '7',
        position: 'ST',
        image: const AssetImage('assets/ronaldo.jpg'),
      ),
      FootballPlayer(
        name: 'Messi',
        number: '10',
        position: 'winger',
        image: const AssetImage('assets/mesii.jpg'),
      ),
      FootballPlayer(
        name: 'Neymar',
        number: '11',
        position: 'winger',
        image: const AssetImage('assets/nema.jpg'),
      ),
      FootballPlayer(
        name: 'gareth bale',
        number: '11',
        position: 'winger',
        image: const AssetImage('assets/bale.jpg'),
      ),
      FootballPlayer(
        name: 'mbappe',
        number: '9',
        position: 'ST',
        image: const AssetImage('assets/mbappe.jpg'),
      ),
    ]);
    super.onInit();
  }

  void updatePlayer(int index, FootballPlayer player) {
    players[index] = player;
    players.refresh();
  }
}
