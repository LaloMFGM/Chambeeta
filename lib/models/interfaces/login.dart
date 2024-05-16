import 'dart:convert';

class Login {
    String token;
    DateTime expiracion;

    Login({
        required this.token,
        required this.expiracion,
    });

    factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        expiracion: DateTime.parse(json["expiracion"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiracion": expiracion.toIso8601String(),
    };
}
