// To parse this JSON data, do
//
//     final invalidLoginUserModel = invalidLoginUserModelFromJson(jsonString);

import 'dart:convert';

InvalidLoginUserModel invalidLoginUserModelFromJson(String str) => InvalidLoginUserModel.fromJson(json.decode(str));

String invalidLoginUserModelToJson(InvalidLoginUserModel data) => json.encode(data.toJson());

class InvalidLoginUserModel {
  InvalidLoginUserModel({
    required this.responseTime,
    required this.data,
  });

  double responseTime;
  Data data;

  factory InvalidLoginUserModel.fromJson(Map<String, dynamic> json) => InvalidLoginUserModel(
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
    required this.error,
  });

  int status;
  String message;
  String error;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "error": error,
  };
}
