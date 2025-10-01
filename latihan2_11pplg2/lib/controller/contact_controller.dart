import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/dbHelper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final names = <String>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data.map((e) => e['name'] as String).toList();
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> deleteName(int index) async {
    final name = names[index];
    await _dbHelper.deleteName(name);
    fetchNames();
  }

  Future<void> updateName(String oldName, String newName) async {
    await _dbHelper.updateName(oldName, newName);
    fetchNames();
  }

  void showUpdateDialog(BuildContext context, String oldName, int index) {
    final updateController = TextEditingController(text: oldName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Name"),
          content: TextField(
            controller: updateController,
            decoration: const InputDecoration(labelText: "New Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final newName = updateController.text.trim();
                if (newName.isNotEmpty) {
                  updateName(oldName, newName);
                }
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
