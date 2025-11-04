import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/football_player_controller.dart';
import 'package:latihan2_11pplg2/controller/kalkulator.dart';
import 'package:latihan2_11pplg2/controller/mainmenu_controler.dart';
import 'package:latihan2_11pplg2/controller/LoginAPIcontroller.dart';

class MainmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballPlayerController>(() => FootballPlayerController());
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<MainmenuController>(() => MainmenuController());
    Get.lazyPut<LoginAPIController>(() => LoginAPIController());
  }
}
