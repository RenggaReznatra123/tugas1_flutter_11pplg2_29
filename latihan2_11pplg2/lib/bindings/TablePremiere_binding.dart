import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/TablePremiere_controller.dart';

class TablepremiereBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TablepremiereController());
  }
}
