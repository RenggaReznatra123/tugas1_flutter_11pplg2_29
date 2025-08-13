import 'package:get/get.dart';
import 'package:latihan2_11pplg2/pages/football_pages.dart';
import 'package:latihan2_11pplg2/pages/kalkulator_pages.dart';
import 'package:latihan2_11pplg2/pages/editplayer_pages.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculatorPage, page: () => KalkulatorPage()),
    GetPage(name: AppRoutes.footballPages, page: () => FootballPages()),
    GetPage(
      name: AppRoutes.editPlayerPages,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return EditPlayerPages(player: args['player'], index: args['index']);
      },
    ),
  ];
}
