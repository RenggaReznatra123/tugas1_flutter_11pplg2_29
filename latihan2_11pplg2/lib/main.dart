import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:latihan2_11pplg2/pages/kalkulator_pages.dart';
import 'package:latihan2_11pplg2/login_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: KalkulatorPage(),
    );
  }
}
