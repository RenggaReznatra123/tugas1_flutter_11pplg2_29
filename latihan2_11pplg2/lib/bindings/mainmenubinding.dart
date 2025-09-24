import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/football_player_controller.dart';
import 'package:latihan2_11pplg2/controller/kalkulator.dart';
import 'package:latihan2_11pplg2/controller/mainmenu_controler.dart';
import 'package:latihan2_11pplg2/fragment/profile_fragment.dart';

class Mainmenubinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FootballPlayerController>(() => FootballPlayerController());
    Get.lazyPut<profileFragment>(() => profileFragment());
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }
}
