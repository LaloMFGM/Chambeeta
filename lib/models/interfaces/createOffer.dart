import 'dart:convert';

class CreateOffer {
    String title;
    String description;
    String requirements;
    int salary;
    String location;

    CreateOffer({
        required this.title,
        required this.description,
        required this.requirements,
        required this.salary,
        required this.location,
    });

    factory CreateOffer.fromRawJson(String str) => CreateOffer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateOffer.fromJson(Map<String, dynamic> json) => CreateOffer(
        title: json["title"],
        description: json["description"],
        requirements: json["requirements"],
        salary: json["salary"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "requirements": requirements,
        "salary": salary,
        "location": location,
    };
}
