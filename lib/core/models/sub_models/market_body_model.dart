// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class MarketBodyModel {
  String name;
  String location;
  String descrption;
  XFile ?image;

  MarketBodyModel({
    required this.name,
    required this.location,
    required this.descrption,
     this.image,
  });

  factory MarketBodyModel.fromJson(Map<String,dynamic>json){
    return MarketBodyModel(
      name: json[ApiKey.name],
     location: json[ApiKey.location],
      descrption: json[ApiKey.description]);
  }

  Map<String,dynamic>toJson(){
    return {
      ApiKey.name:name,
      ApiKey.location:location,
      ApiKey.description:descrption,
      ApiKey.image:image,

    };
  }
}
