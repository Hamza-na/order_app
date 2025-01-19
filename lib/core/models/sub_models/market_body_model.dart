// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dio/dio.dart';
import 'package:order_app/core/databases/api/end_points.dart';


class MarketBodyModel {
  String name;
  String location;
  String descrption;
  MultipartFile ?image;
  String ?method;

  MarketBodyModel({
    required this.name,
    required this.location,
    required this.descrption,
     this.image,
      this.method
  });

  factory MarketBodyModel.fromJson(Map<String,dynamic>json){
    return MarketBodyModel(
      name: json[ApiKey.name],
     location: json[ApiKey.location],
      method: json[ApiKey.method],
      descrption: json[ApiKey.description]);
  }

  Map<String,dynamic>toJson(){
    Map<String,dynamic> toJson = {
      ApiKey.name:name,
      ApiKey.location:location,
      ApiKey.description:descrption,
      ApiKey.image:image,
    };
    if(method != null){
      toJson[ApiKey.method] = method;
    }
    return toJson;
    
  }
}
