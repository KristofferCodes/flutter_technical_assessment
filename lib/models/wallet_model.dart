// To parse this JSON data, do
//
//     final walletInfo = walletInfoFromJson(jsonString);

import 'dart:convert';

WalletInfo walletInfoFromJson(String str) =>
    WalletInfo.fromJson(json.decode(str));

String walletInfoToJson(WalletInfo data) => json.encode(data.toJson());

class WalletInfo {
  bool? success;
  String? message;
  Data? data;

  WalletInfo({
    this.success,
    this.message,
    this.data,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) => WalletInfo(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? uuid;
  int? balance;
  String? userId;
  String? celebrityId;
  String? currency;
  DateTime? createdAt;

  Data({
    this.uuid,
    this.balance,
    this.userId,
    this.celebrityId,
    this.currency,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        balance: json["balance"],
        userId: json["userId"],
        celebrityId: json["celebrityId"],
        currency: json["currency"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "balance": balance,
        "userId": userId,
        "celebrityId": celebrityId,
        "currency": currency,
        "createdAt": createdAt?.toIso8601String(),
      };
}
