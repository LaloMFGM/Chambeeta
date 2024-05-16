import 'dart:convert';

class PersnonalInfo {
    String userAddress;
    String phoneNumber;
    String firstName;
    String lasttName;
    DateTime dateOfBirth;

    PersnonalInfo({
        required this.userAddress,
        required this.phoneNumber,
        required this.firstName,
        required this.lasttName,
        required this.dateOfBirth,
    });

    factory PersnonalInfo.fromRawJson(String str) => PersnonalInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PersnonalInfo.fromJson(Map<String, dynamic> json) => PersnonalInfo(
        userAddress: json["userAddress"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lasttName: json["lasttName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    );

    Map<String, dynamic> toJson() => {
        "userAddress": userAddress,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lasttName": lasttName,
        "dateOfBirth": dateOfBirth.toIso8601String(),
    };
}
