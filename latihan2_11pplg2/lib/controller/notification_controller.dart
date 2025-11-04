import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  var lastMessage = "Waiting for messages...".obs;
  var token = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initFCM();
  }

  Future<void> _initFCM() async {
    // Request permission
    NotificationSettings settings = await _messaging.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    // Get token
    token.value = await _messaging.getToken() ?? "No token";
    print("📱 Token: ${token.value}");

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📨 Foreground: ${message.notification?.title}");
      lastMessage.value =
          "${message.notification?.title ?? 'No title'}\n${message.notification?.body ?? 'No body'}";
    });

    // When opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 Opened from background");
      lastMessage.value =
          "Opened: ${message.notification?.title ?? 'No title'}";
    });
  }
}
