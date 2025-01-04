// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

deliveryPersonProfile deliveryPersonProfileFromJson(String str) => deliveryPersonProfile.fromJson(json.decode(str));

String deliveryPersonProfileJson(deliveryPersonProfile data) => json.encode(data.toJson());

class deliveryPersonProfile {
  String message;
  bool error;
  deliveryPersonProfileData? data;

  deliveryPersonProfile({
    required this.message,
    required this.error,
    required this.data,
  });

  factory deliveryPersonProfile.fromJson(Map<String, dynamic> json) => deliveryPersonProfile(
    message: json["message"],
    error: json["error"],
    data: json["data"] != null ? deliveryPersonProfileData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data?.toJson() ?? {},
  };
}

class deliveryPersonProfileData {
  int deliveryPersonId;
  int sellerId;
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String profileImage;
  String fullAddress;
  String city;
  String personState;
  String country;
  String activeStatus;

  deliveryPersonProfileData({
    required this.deliveryPersonId,
    required this.sellerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.profileImage,
    required this.fullAddress,
    required this.city,
    required this.personState,
    required this.country,
    required this.activeStatus,
  });

  factory deliveryPersonProfileData.fromJson(Map<String, dynamic> json) => deliveryPersonProfileData(
    deliveryPersonId: json["deliveryPersonId"],
    sellerId: json["sellerId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    profileImage: json["profileImage"],
    fullAddress: json["fullAddress"],
    city: json["city"],
    personState: json["personState"],
    country: json["country"],
    activeStatus: json["activeStatus"],
  );

  Map<String, dynamic> toJson() => {
    "deliveryPersonId": deliveryPersonId,
    "sellerId": sellerId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "mobileNumber": mobileNumber,
    "profileImage": profileImage,
    "fullAddress": fullAddress,
    "city": city,
    "personState": personState,
    "country": country,
    "activeStatus": activeStatus,
  };
}
