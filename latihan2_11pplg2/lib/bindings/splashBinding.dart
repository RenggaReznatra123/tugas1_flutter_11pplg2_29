import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/splashscreen_contoller.dart';

class splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
