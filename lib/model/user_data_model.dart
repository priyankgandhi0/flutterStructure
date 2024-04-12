// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  Data? data;
  String? msg;
  bool? status;

  UserDataModel({
    this.data,
    this.msg,
    this.status,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"]==1,
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  int? userId;
  String? userToken;
  String? userName;
  String? userProfilePic;
  String? email;
  String? gender;
  String? countryCode;
  String? phoneNumber;
  String? loginType;
  String? authToken;
  String? devicePushToken;
  String? verifyForgotCode;
  int? isLoggedOut;

  Data({
    this.userId,
    this.userToken,
    this.userName,
    this.userProfilePic,
    this.email,
    this.gender,
    this.countryCode,
    this.phoneNumber,
    this.loginType,
    this.authToken,
    this.devicePushToken,
    this.verifyForgotCode,
    this.isLoggedOut,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    userToken: json["user_token"],
    userName: json["user_name"],
    userProfilePic: json["user_profile_pic"],
    email: json["email"],
    gender: json["gender"],
    countryCode: json["country_code"],
    phoneNumber: json["phone_number"],
    loginType: json["login_type"],
    authToken: json["auth_token"],
    devicePushToken: json["device_push_token"],
    verifyForgotCode: json["verify_forgot_code"],
    isLoggedOut: json["is_logged_out"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_token": userToken,
    "user_name": userName,
    "user_profile_pic": userProfilePic,
    "email": email,
    "gender": gender,
    "country_code": countryCode,
    "phone_number": phoneNumber,
    "login_type": loginType,
    "auth_token": authToken,
    "device_push_token": devicePushToken,
    "verify_forgot_code": verifyForgotCode,
    "is_logged_out": isLoggedOut,
  };
}
