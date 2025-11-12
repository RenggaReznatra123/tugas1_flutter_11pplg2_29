import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/ProfileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
