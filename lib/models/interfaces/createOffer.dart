import 'dart:convert';

class CreateOffers {
    String title;
    String description;
    String requirements;
    int salary;
    String location;

    CreateOffers({
        required this.title,
        required this.description,
        required this.requirements,
        required this.salary,
        required this.location,
    });

    factory CreateOffers.fromRawJson(String str) => CreateOffers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateOffers.fromJson(Map<String, dynamic> json) => CreateOffers(
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
