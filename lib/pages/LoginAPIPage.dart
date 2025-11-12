import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/LoginAPIController.dart';
import 'package:latihan_11pplg2/controllers/notification_controller.dart';

class LoginAPIPage extends StatelessWidget {
  const LoginAPIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginAPIController>();
    final NotificationController c = Get.put(NotificationController());

    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login API")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: username,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        controller.login(username.text, password.text);
                      },
                      child: const Text("Login"),
                    ),
            ),
            const SizedBox(height: 20),

            // 🔹 Tombol Login dengan Google
            OutlinedButton.icon(
              icon: Image.asset(
                'images/google_logo.png', // tambahkan logo di assets
                height: 24,
              ),
              label: const Text(
                "Login with Google",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                controller.loginWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
