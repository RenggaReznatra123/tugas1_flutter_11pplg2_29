import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/football_player_controller.dart';
import '../routes/routes.dart';

class FootballPages extends StatelessWidget {
  FootballPages({super.key});

  final footballPlayerController = Get.put(FootballPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Besito Team Player")),
      body: Obx(
        () => ListView.builder(
          itemCount: footballPlayerController.players.length,
          itemBuilder: (context, index) {
            final player = footballPlayerController.players[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: player.image),
              title: Text(player.name),
              subtitle: Text('${player.position} • #${player.number}'),
              onTap: () {
                Get.toNamed(
                  AppRoutes.editPlayerPages,
                  arguments: {'player': player, 'index': index},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
