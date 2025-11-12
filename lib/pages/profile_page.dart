import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: controller.photoUrl.value.isNotEmpty
                    ? NetworkImage(controller.photoUrl.value)
                    : const AssetImage("assets/images/profile.png")
                          as ImageProvider,
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                controller.username.value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                controller.email.value,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
