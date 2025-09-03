import 'package:get/get.dart';
import '../fragment/home_fragment.dart';
import '../fragment/football_fragment.dart';
import '../fragment/profile_fragment.dart';

class MainmenuController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [HomeFragment(), FootballFragment(), profileFragment()];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
