import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:latihan2_11pplg2/controller/example_controller.dart';

class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}
