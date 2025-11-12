import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan2_11pplg2/routes/routes.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var displayName = "".obs;
  var email = "".obs;
  var photoUrl = "".obs;
  var isLoggedIn = false.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  /// Cek user login dari SharedPreferences / Firebase
  Future<void> loadUserData() async {
    isLoading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();

    // Ambil data login dari shared prefs
    String? name = pref.getString("google_name");
    String? mail = pref.getString("google_email");
    String? photo = pref.getString("google_photo");

    // Kalau data ada, berarti sudah login
    if (name != null && mail != null) {
      displayName.value = name;
      email.value = mail;
      photoUrl.value = photo ?? "";
      isLoggedIn.value = true;
    } else {
      // Coba ambil dari Firebase (kalau login Google)
      final user = _auth.currentUser;
      if (user != null) {
        displayName.value = user.displayName ?? "User";
        email.value = user.email ?? "-";
        photoUrl.value = user.photoURL ?? "";
        isLoggedIn.value = true;
      } else {
        isLoggedIn.value = false;
      }
    }

    isLoading.value = false;
  }

  /// Fungsi logout → ke Splash
  Future<void> logout(BuildContext context) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();

      // Reset state
      displayName.value = "";
      email.value = "";
      photoUrl.value = "";
      isLoggedIn.value = false;

      // Snackbar
      Get.snackbar(
        "Logout Berhasil",
        "Kamu sudah keluar dari akun",
        snackPosition: SnackPosition.BOTTOM,
      );

      // Arahkan ke SplashScreen
      Future.delayed(const Duration(milliseconds: 400), () {
        Get.offAllNamed(AppRoutes.splashpages);
      });
    } catch (e) {
      Get.snackbar("Error", "Gagal logout: $e");
    }
  }

  /// Popup konfirmasi sebelum logout
  void confirmLogout(BuildContext context) {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Yakin ingin logout?",
      textCancel: "Batal",
      textConfirm: "Ya, Logout",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back();
        await logout(context);
      },
    );
  }
}
