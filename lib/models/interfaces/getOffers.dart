import 'dart:convert';

class GetOffers {
    int id;
    String title;
    String description;
    String requirements;
    int salary;
    String location;
    int statusJobId;

    GetOffers({
        required this.id,
        required this.title,
        required this.description,
        required this.requirements,
        required this.salary,
        required this.location,
        required this.statusJobId,
    });

    factory GetOffers.fromRawJson(String str) => GetOffers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetOffers.fromJson(Map<String, dynamic> json) => GetOffers(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        requirements: json["requirements"],
        salary: json["salary"],
        location: json["location"],
        statusJobId: json["statusJobId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "requirements": requirements,
        "salary": salary,
        "location": location,
        "statusJobId": statusJobId,
    };
}

