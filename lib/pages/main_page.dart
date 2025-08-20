import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/main_controller.dart';
import 'package:latihan_11pplg2/routes/routes.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MainController controller = Get.put(MainController());

  final List<String> pages = [
    AppRoutes.calculatorPage,
    AppRoutes.football,
    AppRoutes.profilePage,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: (settings) {
            return GetPageRoute(
              settings: settings,
              page: () => GetRouterOutlet.builder(
                routerDelegate: Get.rootDelegate,
                builder: (context, delegate, currentRoute) {
                  return GetRouterOutlet(
                    initialRoute: pages[controller.currentIndex.value],
                    anchorRoute: '/',
                  );
                },
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
            Get.toNamed(pages[index], id: 1);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Kalkulator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
