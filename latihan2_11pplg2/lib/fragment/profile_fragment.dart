import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/ProfileController.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // --- Tentukan data yang mau ditampilkan ---
          final bool isGoogleLogin = controller.email.value.contains(
            '@gmail.com',
          );

          final String displayName = isGoogleLogin
              ? controller.displayName.value
              : 'Rengga';

          final String email = isGoogleLogin ? controller.email.value : '-';

          final ImageProvider avatar =
              isGoogleLogin && controller.photoUrl.value.isNotEmpty
              ? NetworkImage(controller.photoUrl.value)
              : const AssetImage('assets/danis.png');

          // --- UI utama ---
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Profil Saya",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 40),

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 60, backgroundImage: avatar),
                        const SizedBox(height: 20),
                        Text(
                          displayName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // 🔹 Tombol Logout dan Table Premiere BERDAMPINGAN
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  controller.confirmLogout(context);
                                },
                                icon: const Icon(Icons.logout),
                                label: const Text("Logout"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.tablePremierePages);
                                },
                                icon: const Icon(Icons.table_chart),
                                label: const Text("Table Premiere"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
