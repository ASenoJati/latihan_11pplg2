import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/contact_controller.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(title: const Text("Contact List"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: "Enter name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: controller.addName,
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List of names
            Expanded(
              child: Obx(() {
                if (controller.names.isEmpty) {
                  return const Center(child: Text("No contacts available."));
                }
                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    final contact = controller.names[index];
                    return Card(
                      child: ListTile(
                        title: Text(contact['name']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Edit button
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                final editController = TextEditingController(
                                  text: contact['name'],
                                );
                                Get.defaultDialog(
                                  title: "Edit Name",
                                  content: TextField(
                                    controller: editController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.updateName(
                                        contact['id'],
                                        editController.text,
                                      );
                                      Get.back();
                                    },
                                    child: const Text("Save"),
                                  ),
                                  cancel: OutlinedButton(
                                    onPressed: Get.back,
                                    child: const Text("Cancel"),
                                  ),
                                );
                              },
                            ),

                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Konfirmasi Delete",
                                  middleText:
                                      "Apakah Anda yakin ingin menghapus '${contact['name']}'?",
                                  confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.deleteName(contact['id']);
                                      Get.back();
                                    },
                                    child: const Text("Delete"),
                                  ),
                                  cancel: OutlinedButton(
                                    onPressed: Get.back,
                                    child: const Text("Cancel"),
                                  ),
                                );
                              },
                            ),
                          ],
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
