import 'dart:convert';

class PersonalInfo {
    String userAddress;
    String phoneNumber;
    String firstName;
    String lasttName;
    DateTime dateOfBirth;
    String skills;

    PersonalInfo({
        required this.userAddress,
        required this.phoneNumber,
        required this.firstName,
        required this.lasttName,
        required this.dateOfBirth,
        required this.skills,
    });

    factory PersonalInfo.fromRawJson(String str) => PersonalInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        userAddress: json["userAddress"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lasttName: json["lasttName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        skills: json["skills"],
    );

    Map<String, dynamic> toJson() => {
        "userAddress": userAddress,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lasttName": lasttName,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "skills": skills,
    };
}
