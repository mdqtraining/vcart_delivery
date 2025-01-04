// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/widgets.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel with ChangeNotifier{
  String message;
  bool error;
  LoginData? data;

  LoginModel({
    required this.message,
    required this.error,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
    message: json["message"] ?? "Don't worry my boy",
    error: json["error"] ?? "its your first step",
    data: json['data'] != null ? LoginData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data?.toJson() ?? {},
  };
}

class LoginData {
  int deliveryPersonId;
  String firstName;
  String lastName;
  String fullName;
  String bearerToken;
  String email;
  String deliveryPersonMobile;
  String profileImage;
  String fullAddress;
  String city;
  String personState;
  String country;

  LoginData({
    required this.deliveryPersonId,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.bearerToken,
    required this.email,
    required this.deliveryPersonMobile,
    required this.profileImage,
    required this.fullAddress,
    required this.city,
    required this.personState,
    required this.country,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    //if(json['data'] != null)
    deliveryPersonId: json["deliveryPersonId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    bearerToken: json["bearerToken"],
    email: json["email"],
    deliveryPersonMobile: json["deliveryPersonMobile"],
    profileImage: json["profileImage"],
    fullAddress: json["fullAddress"],
    city: json["city"],
    personState: json["personState"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "deliveryPersonId": deliveryPersonId,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "bearerToken": bearerToken,
    "email": email,
    "deliveryPersonMobile": deliveryPersonMobile,
    "profileImage": profileImage,
    "fullAddress": fullAddress,
    "city": city,
    "personState": personState,
    "country": country,
  };
}

