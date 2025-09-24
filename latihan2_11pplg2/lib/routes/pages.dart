import 'package:get/get.dart';
import 'package:latihan2_11pplg2/bindings/calculatorbinding.dart';
import 'package:latihan2_11pplg2/bindings/loginbinding.dart';
import 'package:latihan2_11pplg2/bindings/mainmenubinding.dart';
import 'package:latihan2_11pplg2/bindings/splashBinding.dart';
import 'package:latihan2_11pplg2/pages/mainmenu_page.dart';
import 'package:latihan2_11pplg2/pages/kalkulator_pages.dart';
import 'package:latihan2_11pplg2/pages/football_pages.dart';
import 'package:latihan2_11pplg2/pages/editplayer_pages.dart';
import 'package:latihan2_11pplg2/pages/splashScreen.dart';
import 'package:latihan2_11pplg2/pages/loginpages.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.mainMenuPage,
      page: () => MainmenuPage(),
      binding: Mainmenubinding(),
    ),
    GetPage(
      name: AppRoutes.loginpages,
      page: () => LoginPages(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: AppRoutes.splashpages,
      page: () => SplashscreenPage(),
      binding: splashbinding(),
    ),
    GetPage(
      name: AppRoutes.calculatorPage,
      page: () => KalkulatorPages(),
      binding: Calculatorbinding(),
    ),
    GetPage(name: AppRoutes.footballPages, page: () => FootballPages()),
    GetPage(name: AppRoutes.editPlayerPages, page: () => EditPlayerPages()),
  ];
}
