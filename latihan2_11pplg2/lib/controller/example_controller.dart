import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController {
  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
