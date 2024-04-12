// To parse this JSON data, do
//
//     final servicesListModel = servicesListModelFromJson(jsonString);

import 'dart:convert';

ServicesListModel servicesListModelFromJson(String str) => ServicesListModel.fromJson(json.decode(str));

String servicesListModelToJson(ServicesListModel data) => json.encode(data.toJson());

class ServicesListModel {
  bool? status;
  String? msg;
  List<ServiceData>? data;

  ServicesListModel({
    this.status,
    this.msg,
    this.data,
  });

  factory ServicesListModel.fromJson(Map<String, dynamic> json) => ServicesListModel(
    status: json["status"]==1,
    msg: json["msg"],
    data: json["data"] == null ? [] : List<ServiceData>.from(json["data"]!.map((x) => ServiceData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ServiceData {
  int? serviceId;
  String? serviceName;
  String? serviceInformation;
  String? serviceImage;
  String? serviceExperiance;
  String? serviceCompletes;

  ServiceData({
    this.serviceId,
    this.serviceName,
    this.serviceInformation,
    this.serviceImage,
    this.serviceExperiance,
    this.serviceCompletes,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
    serviceId: json["service_id"],
    serviceName: json["service_name"],
    serviceInformation: json["service_information"],
    serviceImage: json["service_image"],
    serviceExperiance: json["service_experiance"],
    serviceCompletes: json["service_completes"],
  );

  Map<String, dynamic> toJson() => {
    "service_id": serviceId,
    "service_name": serviceName,
    "service_information": serviceInformation,
    "service_image": serviceImage,
    "service_experiance": serviceExperiance,
    "service_completes": serviceCompletes,
  };
}
