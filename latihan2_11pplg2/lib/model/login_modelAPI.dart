// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);
import 'dart:convert';

Loginmodel loginmodelFromJson(String str) =>
    Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  bool status;
  String message;
  String token;

  Loginmodel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
  };
}
