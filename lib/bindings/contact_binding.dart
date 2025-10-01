import 'package:get/get.dart';
import 'package:latihan_11pplg2/controllers/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
