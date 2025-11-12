import 'package:get/get.dart';
import 'package:latihan2_11pplg2/bindings/TablePremiere_binding.dart';
import 'package:latihan2_11pplg2/bindings/calculatorbinding.dart';
import 'package:latihan2_11pplg2/bindings/contact_binding.dart';
import 'package:latihan2_11pplg2/bindings/example_binding.dart';
import 'package:latihan2_11pplg2/bindings/loginbinding.dart';
import 'package:latihan2_11pplg2/bindings/mainmenubinding.dart';
import 'package:latihan2_11pplg2/bindings/profilebinding.dart';
import 'package:latihan2_11pplg2/bindings/splashBinding.dart';
import 'package:latihan2_11pplg2/bindings/LoginAPIBinding.dart';
import 'package:latihan2_11pplg2/controller/edit_player_controller.dart';
import 'package:latihan2_11pplg2/controller/football_player_controller.dart';
import 'package:latihan2_11pplg2/pages/TablePremiere_pages.dart';
import 'package:latihan2_11pplg2/pages/contact_pages.dart';
import 'package:latihan2_11pplg2/pages/editplayer_pages.dart';
import 'package:latihan2_11pplg2/pages/example/example_transform.dart';
import 'package:latihan2_11pplg2/pages/football/football_transform.dart';
import 'package:latihan2_11pplg2/pages/home_page.dart';
import 'package:latihan2_11pplg2/pages/mainmenu_page.dart';
import 'package:latihan2_11pplg2/pages/kalkulator_pages.dart';
import 'package:latihan2_11pplg2/pages/splashScreen.dart';
import 'package:latihan2_11pplg2/pages/loginpages.dart';
import 'package:latihan2_11pplg2/pages/LoginAPIpages.dart';
import 'package:latihan2_11pplg2/fragment/profile_fragment.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.mainMenuPage,
      page: () => MainmenuPage(),
      binding: MainmenuBinding(),
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
    GetPage(
      name: AppRoutes.contactPages,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.examplepages,
      page: () => ExampleTransform(),
      binding: ExampleBinding(),
    ),
    GetPage(
      name: AppRoutes.footballFragment,
      page: () => FootballTransform(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => FootballPlayerController());
      }),
    ),
    GetPage(
      name: AppRoutes.editPlayerPages,
      page: () => EditPlayerPages(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EditPlayerController());
      }),
    ),
    GetPage(
      name: AppRoutes.loginAPIpages,
      page: () => LoginAPIPage(),
      binding: LoginAPIBinding(),
    ),
    GetPage(
      name: AppRoutes.profileFragment,
      page: () => const ProfileFragment(),
      binding: ProfileBinding(),
    ),
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
    GetPage(
      name: AppRoutes.tablePremierePages,
      page: () => const TablepremierePages(),
      binding: TablepremiereBinding(),
    ),
  ];
}
