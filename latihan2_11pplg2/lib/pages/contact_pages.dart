import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/contact_controller.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: contactController.nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),  
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: contactController.addName,
                  child: const Text("Save"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (contactController.names.isEmpty) {
                  return const Center(child: Text("Belum ada data"));
                }
                return ListView.builder(
                  itemCount: contactController.names.length,
                  itemBuilder: (context, index) {
                    final name = contactController.names[index];
                    return Dismissible(
                      key: Key(name),
                      direction: DismissDirection.startToEnd, // swipe kanan
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) {
                        contactController.deleteName(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$name deleted")),
                        );
                      },
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(name),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            contactController.showUpdateDialog(
                              context,
                              name,
                              index,
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
