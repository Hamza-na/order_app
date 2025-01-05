import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/entities/sub_entities/user_entitiy.dart';

class UserModel extends UserEntitiy {
  String role;
  String updatedAt;
  String createdAt;
  int id;

  UserModel({
    required super.name,
    required super.phoneNumber,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required super.lang,
    super.image,
    super.location,
    required this.id,
  });


  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      lang: json[ApiKey.language],
      name:json[ApiKey.name] ,
      image: json[ApiKey.image],
      location:  json[ApiKey.location],
      phoneNumber: json[ApiKey.phoneNumber],
      role: json[ApiKey.role], 
      updatedAt: json[ApiKey.updatedAt],
      createdAt: json[ApiKey.createdAt], 
      id: json[ApiKey.id]);
  }

  Map<String,dynamic>toJson(){
    return {
      ApiKey.name :name,
      ApiKey.phoneNumber :phoneNumber,
      ApiKey.role :role,
      ApiKey.updatedAt :updatedAt,
      ApiKey.createdAt :createdAt,
      ApiKey.id :id,
      ApiKey.image :image,
      ApiKey.location :location 
    };
  }
}
