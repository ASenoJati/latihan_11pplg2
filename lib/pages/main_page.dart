import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/main_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text("My Menu App")),
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeIndex,
          currentIndex: controller.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp),
              label: "Team",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
