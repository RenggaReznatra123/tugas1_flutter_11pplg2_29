import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';
import 'package:latihan2_11pplg2/routes/AppData.dart';
import 'package:latihan2_11pplg2/model/login_modelAPI.dart';

class LoginAPIController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ------------------- LOGIN API -------------------
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

        Get.snackbar("Success", "Login berhasil!");
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

  // ------------------- LOGIN GOOGLE -------------------
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar("Dibatalkan", "Login dibatalkan oleh pengguna");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      // Simpan data user di SharedPreferences
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("google_name", googleUser.displayName ?? "");
      await pref.setString("google_email", googleUser.email);
      await pref.setString("google_photo", googleUser.photoUrl ?? "");

      Get.snackbar("Sukses", "Login Google berhasil!");
      Get.offAllNamed(AppRoutes.mainMenuPage);
    } catch (e) {
      Get.snackbar("Error", "Gagal login Google: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------- TOKEN MANAGEMENT -------------------
  Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", token);
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  Future<void> clearToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("token");
    await pref.remove("google_name");
    await pref.remove("google_email");
    await pref.remove("google_photo");
  }
}
