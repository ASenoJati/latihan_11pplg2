import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/responsive_football_controller.dart';
import 'package:latihan_11pplg2/pages/football/football_mobile.dart';
import 'package:latihan_11pplg2/pages/football/football_widescreen.dart';

class FootballPlayer extends StatelessWidget {
  FootballPlayer({super.key});

  final controller = Get.put(ResponsiveFootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? FootballMobile()
                : FootballWidescreen(),
          );
        },
      ),
    );
  }
}
