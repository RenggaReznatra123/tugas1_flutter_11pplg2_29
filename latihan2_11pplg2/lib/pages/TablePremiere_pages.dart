import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/TablePremiere_controller.dart';

class TablepremierePages extends StatelessWidget {
  const TablepremierePages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TablepremiereController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Table Premiere',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.tablestanding.isEmpty) {
            return const Center(child: Text('Tidak ada data.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await controller.fetchAPITablePremiere();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.tablestanding.length,
              itemBuilder: (context, index) {
                final team = controller.tablestanding[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          child: Text(
                            team.intRank ?? '-',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundImage:
                              team.strBadge != null && team.strBadge!.isNotEmpty
                              ? NetworkImage(team.strBadge!)
                              : null,
                          radius: 18,
                          child: team.strBadge == null || team.strBadge!.isEmpty
                              ? const Icon(Icons.image_not_supported)
                              : null,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Text(
                            team.strTeam ?? 'Unknown',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Main: ${team.intPlayed ?? '-'}"),
                              Text("Poin: ${team.intPoints ?? '-'}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
