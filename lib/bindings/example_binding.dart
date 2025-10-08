import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/example_controller.dart';

class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}
