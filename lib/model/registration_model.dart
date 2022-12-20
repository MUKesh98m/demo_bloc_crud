// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  RegistrationModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  bool? status;
  String? message;
  Data? data;
  String? token;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
        "token": token == null ? null : token,
      };
}

class Data {
  Data({
    this.name,
    this.email,
    this.gender,
    this.image,
    this.birthDate,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? email;
  String? gender;
  String? image;
  DateTime? birthDate;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        gender: json["gender"] == null ? null : json["gender"],
        image: json["image"] == null ? null : json["image"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "gender": gender == null ? null : gender,
        "image": image == null ? null : image,
        "birth_date": birthDate == null
            ? null
            : "${birthDate?.year.toString().padLeft(4, '0')}-${birthDate?.month.toString().padLeft(2, '0')}-${birthDate?.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "id": id == null ? null : id,
      };
}
