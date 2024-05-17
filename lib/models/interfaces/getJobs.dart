// To parse this JSON data, do
//
//     final getJobs = getJobsFromJson(jsonString);

import 'dart:convert';

List<GetJobs> getJobsFromJson(String str) => List<GetJobs>.from(json.decode(str).map((x) => GetJobs.fromJson(x)));

String getJobsToJson(List<GetJobs> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetJobs {
    int id;
    int jobsId;
    DateTime dateCompleted;
    int statusJobId;
    Jobs jobs;

    GetJobs({
        required this.id,
        required this.jobsId,
        required this.dateCompleted,
        required this.statusJobId,
        required this.jobs,
    });

    factory GetJobs.fromJson(Map<String, dynamic> json) => GetJobs(
        id: json["id"],
        jobsId: json["jobsId"],
        dateCompleted: DateTime.parse(json["dateCompleted"]),
        statusJobId: json["statusJobId"],
        jobs: Jobs.fromJson(json["jobs"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jobsId": jobsId,
        "dateCompleted": dateCompleted.toIso8601String(),
        "statusJobId": statusJobId,
        "jobs": jobs.toJson(),
    };
}

class Jobs {
    int id;
    String title;
    String description;
    String requirements;
    double salary;
    String location;
    int userId;
    int statusJobId;
    User? user;
    dynamic statusJob;

    Jobs({
        required this.id,
        required this.title,
        required this.description,
        required this.requirements,
        required this.salary,
        required this.location,
        required this.userId,
        required this.statusJobId,
        required this.user,
        required this.statusJob,
    });

    factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        requirements: json["requirements"],
        salary: json["salary"],
        location: json["location"],
        userId: json["userId"],
        statusJobId: json["statusJobId"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        statusJob: json["statusJob"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "requirements": requirements,
        "salary": salary,
        "location": location,
        "userId": userId,
        "statusJobId": statusJobId,
        "user": user?.toJson(),
        "statusJob": statusJob,
    };
}

class User {
    int id;
    String userName;
    double qualification;

    User({
        required this.id,
        required this.userName,
        required this.qualification,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        qualification: json["qualification"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "qualification": qualification,
    };
}
