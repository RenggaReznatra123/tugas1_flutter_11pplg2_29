import 'dart:convert';
import 'package:get/get.dart';
import 'package:latihan2_11pplg2/model/Table_Premiere_Model.dart';
import 'package:http/http.dart' as Http;

class TablepremiereController extends GetxController {
  var isLoading = true.obs;
  var tablestanding = <Table>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAPITablePremiere();
  }

  Future<void> fetchAPITablePremiere() async {
    const url =
        'https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026';
    try {
      isLoading.value = true;
      final response = await Http.get(Uri.parse(url));

      print("Status Code: ${response.statusCode.toString()}");
      print("json response: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List standings = data['table'] ?? [];
        tablestanding.assignAll(
          standings.map((e) => Table.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          'Error',
          'Gagal memuat data dari server (status ${response.statusCode})',
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
