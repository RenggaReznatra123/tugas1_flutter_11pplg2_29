import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/loginpages_controler.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
