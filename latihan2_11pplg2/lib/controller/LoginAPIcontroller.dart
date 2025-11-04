import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan2_11pplg2/model/login_modelAPI.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan2_11pplg2/routes/AppData.dart';

class LoginAPIController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    try {
      isLoading.value = true;

      var url = Uri.parse("${Appdata.baseUrl}/latihan/login");
      var response = await http.post(
        url,
        body: {'username': username, 'password': password},
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == true) {
        Loginmodel model = Loginmodel.fromJson(data);

        await saveToken(model.token);

        Get.snackbar("Success", "Sukses Login");
        Get.offAllNamed(AppRoutes.mainMenuPage);
      } else {
        Get.snackbar("Error", data["message"] ?? "Login gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Simpan Token
  Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", token);
  }

  // ✅ Ambil Token
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  // ✅ Hapus Token
  Future<void> clearToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("token");
  }

  // ✅ Fungsi Logout
  Future<void> logout() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove("token"); // hapus token login
      await pref.remove("username"); // jaga-jaga jika username juga disimpan

      Get.snackbar("Logout", "Berhasil keluar dari akun");
      Get.offAllNamed(AppRoutes.splashpages); // kembali ke splash screen
    } catch (e) {
      Get.snackbar("Error", "Gagal logout: $e");
    }
  }
}
