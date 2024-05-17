import 'dart:convert';

class Login {
  String? username;
  String token;
  DateTime expiracion;

  Login({
    this.username,
    required this.token,
    required this.expiracion,
  });

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"],
        token: json["token"],
        expiracion: DateTime.parse(json["expiracion"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "token": token,
        "expiracion": expiracion.toIso8601String(),
      };
}
