import 'package:get/get.dart';
import 'package:latihan2_11pplg2/pages/football/football_transform.dart';
import '../fragment/home_fragment.dart';
import '../fragment/profile_fragment.dart';

class MainmenuController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [HomeFragment(), FootballTransform(), ProfileFragment()];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
