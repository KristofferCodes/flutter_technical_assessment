// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  String? uuid;
  String? reference;
  int? amount;
  int? fee;
  String? currency;
  dynamic metadata;
  String? type;
  String? source;
  dynamic initiator;
  String? celebrityId;
  String? userId;
  String? status;
  dynamic failureReason;
  DateTime? createdAtDateOnly;
  DateTime? createdAt;
  Celebrity? user;
  Celebrity? celebrity;

  Transactions({
    this.uuid,
    this.reference,
    this.amount,
    this.fee,
    this.currency,
    this.metadata,
    this.type,
    this.source,
    this.initiator,
    this.celebrityId,
    this.userId,
    this.status,
    this.failureReason,
    this.createdAtDateOnly,
    this.createdAt,
    this.user,
    this.celebrity,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        uuid: json["uuid"],
        reference: json["reference"],
        amount: json["amount"],
        fee: json["fee"],
        currency: json["currency"],
        metadata: json["metadata"],
        type: json["type"],
        source: json["source"],
        initiator: json["initiator"],
        celebrityId: json["celebrityId"],
        userId: json["userId"],
        status: json["status"],
        failureReason: json["failureReason"],
        createdAtDateOnly: json["createdAtDateOnly"] == null
            ? null
            : DateTime.parse(json["createdAtDateOnly"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        user: json["user"] == null ? null : Celebrity.fromJson(json["user"]),
        celebrity: json["celebrity"] == null
            ? null
            : Celebrity.fromJson(json["celebrity"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "reference": reference,
        "amount": amount,
        "fee": fee,
        "currency": currency,
        "metadata": metadata,
        "type": type,
        "source": source,
        "initiator": initiator,
        "celebrityId": celebrityId,
        "userId": userId,
        "status": status,
        "failureReason": failureReason,
        "createdAtDateOnly":
            "${createdAtDateOnly!.year.toString().padLeft(4, '0')}-${createdAtDateOnly!.month.toString().padLeft(2, '0')}-${createdAtDateOnly!.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt?.toIso8601String(),
        "user": user?.toJson(),
        "celebrity": celebrity?.toJson(),
      };
}

class Celebrity {
  String? uuid;
  String? fullName;
  dynamic userName;
  String? occupation;
  dynamic profileImagePath;
  String? email;
  dynamic dateOfBirth;
  dynamic bio;
  bool? isEmailVerified;
  String? type;
  bool? activeNotification;
  bool? informationSubscription;
  String? eligibility;
  DateTime? createdAtDateOnly;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Celebrity({
    this.uuid,
    this.fullName,
    this.userName,
    this.occupation,
    this.profileImagePath,
    this.email,
    this.dateOfBirth,
    this.bio,
    this.isEmailVerified,
    this.type,
    this.activeNotification,
    this.informationSubscription,
    this.eligibility,
    this.createdAtDateOnly,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Celebrity.fromJson(Map<String, dynamic> json) => Celebrity(
        uuid: json["uuid"],
        fullName: json["fullName"],
        userName: json["userName"],
        occupation: json["occupation"],
        profileImagePath: json["profileImagePath"],
        email: json["email"],
        dateOfBirth: json["dateOfBirth"],
        bio: json["bio"],
        isEmailVerified: json["isEmailVerified"],
        type: json["type"],
        activeNotification: json["activeNotification"],
        informationSubscription: json["informationSubscription"],
        eligibility: json["eligibility"],
        createdAtDateOnly: json["createdAtDateOnly"] == null
            ? null
            : DateTime.parse(json["createdAtDateOnly"]),
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "fullName": fullName,
        "userName": userName,
        "occupation": occupation,
        "profileImagePath": profileImagePath,
        "email": email,
        "dateOfBirth": dateOfBirth,
        "bio": bio,
        "isEmailVerified": isEmailVerified,
        "type": type,
        "activeNotification": activeNotification,
        "informationSubscription": informationSubscription,
        "eligibility": eligibility,
        "createdAtDateOnly":
            "${createdAtDateOnly!.year.toString().padLeft(4, '0')}-${createdAtDateOnly!.month.toString().padLeft(2, '0')}-${createdAtDateOnly!.day.toString().padLeft(2, '0')}",
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
