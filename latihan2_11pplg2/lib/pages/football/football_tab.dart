import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/football_player_controller.dart';
import '../../../routes/routes.dart';

class FootballTab extends StatelessWidget {
  const FootballTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FootballPlayerController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Football Players (Tablet/Desktop)")),
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: controller.players.length,
          itemBuilder: (context, index) {
            final player = controller.players[index];
            return GestureDetector(
              onTap: () =>
                  Get.toNamed(AppRoutes.editPlayerPages, arguments: index),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: player.image),
                    const SizedBox(height: 10),
                    Text(
                      player.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('#${player.number} • ${player.position}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
