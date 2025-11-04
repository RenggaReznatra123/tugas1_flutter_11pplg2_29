import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/football_player_controller.dart';
import '../../../routes/routes.dart';

class FootballMobile extends StatelessWidget {
  const FootballMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FootballPlayerController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Football Players (Mobile)")),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.players.length,
          itemBuilder: (context, index) {
            final player = controller.players[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: CircleAvatar(backgroundImage: player.image),
                title: Text(
                  player.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${player.position} • #${player.number}'),
                onTap: () =>
                    Get.toNamed(AppRoutes.editPlayerPages, arguments: index),
              ),
            );
          },
        ),
      ),
    );
  }
}
