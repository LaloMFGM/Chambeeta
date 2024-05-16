// ignore: file_names
import 'dart:convert';

class ObtainStatus {
    int id;
    String description;

    ObtainStatus({
        required this.id,
        required this.description,
    });

    factory ObtainStatus.fromRawJson(String str) => ObtainStatus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ObtainStatus.fromJson(Map<String, dynamic> json) => ObtainStatus(
        id: json["id"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
    };
}
