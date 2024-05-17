import 'dart:convert';

import 'package:flutter/foundation.dart';

List<GetOffer> getOfferFromJson(String str) => List<GetOffer>.from(json.decode(str).map((x) => GetOffer.fromJson(x)));

String getOfferToJson(List<GetOffer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOffer {
    int id;
    String title;
    String description;
    String requirements;
    double salary;
    String location;
    int statusJobId;
    StatusJob statusJob;

    GetOffer({
        required this.id,
        required this.title,
        required this.description,
        required this.requirements,
        required this.salary,
        required this.location,
        required this.statusJobId,
        required this.statusJob,
    });

    factory GetOffer.fromJson(Map<String, dynamic> json) => GetOffer(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        requirements: json["requirements"],
        salary: json["salary"],
        location: json["location"],
        statusJobId: json["statusJobId"],
        statusJob: StatusJob.fromJson(json["statusJob"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "requirements": requirements,
        "salary": salary,
        "location": location,
        "statusJobId": statusJobId,
        "statusJob": statusJob.toJson(),
    };
}

class StatusJob {
    int id;
    String description;

    StatusJob({
        required this.id,
        required this.description,
    });

    factory StatusJob.fromJson(Map<String, dynamic> json) => StatusJob(
        id: json["id"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
    };
}
