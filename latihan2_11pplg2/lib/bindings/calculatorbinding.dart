import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/kalkulator.dart';

class Calculatorbinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }
}
