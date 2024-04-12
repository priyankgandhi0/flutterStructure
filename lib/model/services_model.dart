// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  String image;
  String title;

  ServicesModel({
    required this.image,
    required this.title,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    image: json["image"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
  };
}
