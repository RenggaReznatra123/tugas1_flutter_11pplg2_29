import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/football_player_controller.dart';
import '../routes/routes.dart';

class FootballFragment extends StatelessWidget {
  FootballFragment({super.key});

  final footballPlayerController = Get.put(FootballPlayerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
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
                  arguments: {'index': index},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
