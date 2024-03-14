// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userImage,
    this.userPhone,
    this.gender,
    this.countryName,
    this.joiningDate,
    this.userReferelCode,
    this.packageId,
    this.amount,
    this.durationDays,
    this.startDate,
    this.endDate,
    this.totalAchievement,
    this.totalDailyGain,
  });

  String? userId;
  String? userName;
  String? userEmail;
  String? userImage;
  String? userPhone;
  String? gender;
  String? countryName;
  String? joiningDate;
  String? userReferelCode;
  String? packageId;
  String? amount;
  String? durationDays;
  String? startDate;
  String? endDate;
  String? totalAchievement;
  String? totalDailyGain;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"].toString(),
        userName: json["user_name"],
        userEmail: json["user_email"],
        userImage: json["user_image"],
        userPhone: json["user_phone"].toString(),
        gender: json["gender"],
        countryName: json["country_id"].toString(),
        joiningDate: json["joining_date"],
        userReferelCode: json["user_referel_code"],
        packageId: json["package_id"].toString(),
        amount: json["amount"].toString() == "null"
            ? "0"
            : json["amount"].toString(),
        durationDays: json["duration_days"].toString(),
        startDate: json["start_date"].toString(),
        endDate: json["end_date"].toString(),
        totalAchievement: json["total_achivement"].toString(),
        totalDailyGain: json["total_daily_gain"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_image": userImage,
        "user_phone": userPhone,
        "gender": gender,
        "country_id": countryName,
        "joining_date": joiningDate,
        "user_referel_code": userReferelCode,
        "package_id": packageId,
        "amount": amount,
        "duration_days": durationDays,
        "start_date": startDate,
        "end_date": endDate,
        "total_achivement": totalAchievement,
        "total_daily_gain": totalDailyGain,
      };
}
