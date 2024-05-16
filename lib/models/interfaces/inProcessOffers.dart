import 'dart:convert';

class InProcessOffers {
    int id;
    int jobsId;
    DateTime dateCompleted;
    int statusJobId;
    Jobs jobs;

    InProcessOffers({
        required this.id,
        required this.jobsId,
        required this.dateCompleted,
        required this.statusJobId,
        required this.jobs,
    });

    factory InProcessOffers.fromRawJson(String str) => InProcessOffers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory InProcessOffers.fromJson(Map<String, dynamic> json) => InProcessOffers(
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
    int salary;
    String location;
    int userId;
    int statusJobId;
    User user;
    StatusJob statusJob;

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

    factory Jobs.fromRawJson(String str) => Jobs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        requirements: json["requirements"],
        salary: json["salary"],
        location: json["location"],
        userId: json["userId"],
        statusJobId: json["statusJobId"],
        user: User.fromJson(json["user"]),
        statusJob: StatusJob.fromJson(json["statusJob"]),
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
        "user": user.toJson(),
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

    factory StatusJob.fromRawJson(String str) => StatusJob.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StatusJob.fromJson(Map<String, dynamic> json) => StatusJob(
        id: json["id"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
    };
}

class User {
    int id;
    String userName;

    User({
        required this.id,
        required this.userName,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
    };
}
