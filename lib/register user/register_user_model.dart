// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUserModel registerUserFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
  RegisterUserModel({
    required this.responseTime,
    required this.data,
  });

  double responseTime;
  Data data;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
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
    required this.error,
    required this.status,
    required this.user,
    required this.message,
  });

  int error;
  int status;
  User user;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    error: json["error"],
    status: json["status"],
    user: User.fromJson(json["user"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "status": status,
    "user": user.toJson(),
    "message": message,
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
    required this.instagramCompaniesName,
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
  String instagramCompaniesName;

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
    instagramCompaniesName: json["instagram_companies_name"],
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
    "instagram_companies_name": instagramCompaniesName,
  };
}
