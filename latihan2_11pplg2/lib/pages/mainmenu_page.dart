import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/controller/mainmenu_controler.dart';
import 'package:latihan2_11pplg2/pages/kalkulator_pages.dart';
import 'package:latihan2_11pplg2/pages/football_pages.dart';
import 'package:latihan2_11pplg2/pages/profile_page.dart';

class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});

  MainmenuController mainmenuController = Get.put(MainmenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text("Nav bar")),
        body: mainmenuController.pages[mainmenuController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: mainmenuController.changePage,
          currentIndex: mainmenuController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "sports",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
