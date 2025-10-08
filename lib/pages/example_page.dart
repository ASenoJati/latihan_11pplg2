import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/example_controller.dart';
import 'package:latihan_11pplg2/pages/example_fitur/example_mobile.dart';
import 'package:latihan_11pplg2/pages/example_fitur/example_widescreen.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? ExampleMobile()
                : ExampleWidescreen(),
          );
        },
      ),
    );
  }
}
