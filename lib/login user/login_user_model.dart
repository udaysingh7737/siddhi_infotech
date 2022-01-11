// To parse this JSON data, do
//
//     final loginUserModel = loginUserModelFromJson(jsonString);

import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  LoginUserModel({
    required this.responseTime,
    required this.data,
  });

  double responseTime;
  Data data;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
    responseTime: json["response_time"].toDouble(),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "response_time": responseTime,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  int status;
  String message;
  String token;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.isTermAccept,
    required this.address,
    required this.addressLat,
    required this.addressLong,
    required this.roleId,
    required this.instagramClientId,
    required this.profileImgUrl,
    required this.firstName,
    required this.lastName,
    required this.gender,
  });

  int id;
  String email;
  int isTermAccept;
  String address;
  String addressLat;
  String addressLong;
  int roleId;
  String instagramClientId;
  String profileImgUrl;
  String firstName;
  String lastName;
  int gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    isTermAccept: json["is_term_accept"],
    address: json["address"],
    addressLat: json["address_lat"],
    addressLong: json["address_long"],
    roleId: json["role_id"],
    instagramClientId: json["instagram_client_id"],
    profileImgUrl: json["profile_img_url"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "is_term_accept": isTermAccept,
    "address": address,
    "address_lat": addressLat,
    "address_long": addressLong,
    "role_id": roleId,
    "instagram_client_id": instagramClientId,
    "profile_img_url": profileImgUrl,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
  };
}