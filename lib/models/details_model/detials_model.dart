import 'dart:convert';

List<DetailsModel> detailsModelFromJson(String str) => List<DetailsModel>.from(
    json.decode(str).map((x) => DetailsModel.fromJson(x)));

// String detailsModelToJson(List<DetailsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailsModel {
  String id;
  String name;
  String affiliations;
  String association;
  String certification;
  String eduandtrain;
  String exp;
  String lan;
  Map<String, dynamic> reviews;
  String specialty;
  bool isBooked;

  DetailsModel(
      {required this.id,
      required this.name,
      required this.affiliations,
      required this.association,
      required this.certification,
      required this.eduandtrain,
      required this.exp,
      required this.lan,
      required this.reviews,
      required this.specialty,
      required this.isBooked});

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
      id: json["id"],
      name: json["name"],
      affiliations: json["affiliations"],
      association: json["association"],
      certification: json["certification"],
      eduandtrain: json["eduandtrain"],
      exp: json["exp"],
      lan: json['lan'],
      reviews: json['reviews'],
      specialty: json['specialty'],
      isBooked: json['isBooked']);

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "username": username,
  //       "email": email,
  //       "phone": phone,
  //       "eduandtrain": eduandtrain,
  //     };
}
