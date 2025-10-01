import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  return const Center(child: Text("No names yet"));
                }
                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    final name = controller.names[index];
                    return Card(child: ListTile(title: Text(name)));
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
