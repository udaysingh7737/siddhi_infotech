// To parse this JSON data, do
//
//     final alreadyRegisterUserModel = alreadyRegisterUserModelFromJson(jsonString);

import 'dart:convert';

AlreadyRegisterUserModel alreadyRegisterUserModelFromJson(String str) => AlreadyRegisterUserModel.fromJson(json.decode(str));

String alreadyRegisterUserModelToJson(AlreadyRegisterUserModel data) => json.encode(data.toJson());

class AlreadyRegisterUserModel {
  AlreadyRegisterUserModel({
    required this.responseTime,
    required this.data,
  });

  double responseTime;
  Data data;

  factory AlreadyRegisterUserModel.fromJson(Map<String, dynamic> json) => AlreadyRegisterUserModel(
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
  Error error;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    message: json["message"],
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "error": error.toJson(),
  };
}

class Error {
  Error({
    required this.email,
  });

  List<String> email;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    email: List<String>.from(json["email"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
  };
}
