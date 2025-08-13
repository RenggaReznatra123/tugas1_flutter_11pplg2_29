import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtangka1 = TextEditingController();
  final txtangka2 = TextEditingController();
  var hasil = ''.obs;

  void tambah() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);

    int hasiljumlah = angka1 + angka2;
    hasil.value = hasiljumlah.toString();
  }

  void kurang() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);

    int hasiljumlah = angka1 - angka2;
    hasil.value = hasiljumlah.toString();
  }

  void kali() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);

    int hasiljumlah = angka1 * angka2;
    hasil.value = hasiljumlah.toString();
  }

  void bagi() {
    int angka1 = int.parse(txtangka1.text);
    int angka2 = int.parse(txtangka2.text);

    double hasiljumlah = angka1 / angka2;
    hasil.value = hasiljumlah.toString();
  }

  void clear() {
    txtangka1.clear();
    txtangka2.clear();
    hasil.value = '';
  }
}
