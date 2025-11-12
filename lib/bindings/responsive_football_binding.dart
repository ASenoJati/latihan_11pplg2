import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/responsive_football_controller.dart';

class ResponsiveFootballBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResponsiveFootballController());
  }
}
