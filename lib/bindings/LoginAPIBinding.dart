import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/LoginAPIController.dart';

class LoginAPIBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginAPIController>(() => LoginAPIController());
  }
}
