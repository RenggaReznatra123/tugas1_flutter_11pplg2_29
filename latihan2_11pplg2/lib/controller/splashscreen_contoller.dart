import 'package:get/get.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") != null) {
      Get.offAllNamed(AppRoutes.mainMenuPage);
    } else {
      Get.offAllNamed(AppRoutes.loginpages);
    }
  }
}
