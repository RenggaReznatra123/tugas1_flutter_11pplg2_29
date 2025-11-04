import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/LoginAPIcontroller.dart';

class LoginAPIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginAPIController>(() => LoginAPIController());
  }
}
