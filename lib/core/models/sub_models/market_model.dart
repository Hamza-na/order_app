import 'package:order_app/core/databases/api/end_points.dart';

class MarketModel {
  String name;
  String location;
  String descrption;
  String updatedAt;
  String createdAt;
  String image;

  MarketModel({
    required this.updatedAt,
    required this.createdAt,
    required this.name,
    required this.location,
    required this.descrption,
    required this.image
    
  });

  factory MarketModel.fromJson(Map<String,dynamic>json){
   return  MarketModel(updatedAt: json[ApiKey.updatedAt],
    createdAt: json[ApiKey.createdAt],
     name: json[ApiKey.name], 
     location: json[ApiKey.location],
      descrption: json[ApiKey.description]
      ,image: json[ApiKey.image]);
  }

}