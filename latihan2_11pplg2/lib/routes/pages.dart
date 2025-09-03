import 'package:get/get.dart';
import 'package:latihan2_11pplg2/pages/mainmenu_page.dart';
import 'package:latihan2_11pplg2/pages/kalkulator_pages.dart';
import 'package:latihan2_11pplg2/pages/football_pages.dart';
import 'package:latihan2_11pplg2/pages/editplayer_pages.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.mainMenuPage, page: () => MainmenuPage()),
    GetPage(name: AppRoutes.calculatorPage, page: () => KalkulatorPages()),
    GetPage(name: AppRoutes.footballPages, page: () => FootballPages()),
    GetPage(name: AppRoutes.editPlayerPages, page: () => EditPlayerPages()),
  ];
}
