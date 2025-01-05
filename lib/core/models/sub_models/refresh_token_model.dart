import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/entities/sub_entities/refresh_token_entitiy.dart';

class RefreshTokenModel extends RefreshTokenEntitiy {
  String tokenType ;
  
  
  RefreshTokenModel({
    required super.token,
    required this.tokenType,
    required super.expiresIn,
    });

  factory RefreshTokenModel.fromJson(Map<String,dynamic>json){
    return RefreshTokenModel(
      token: json[ApiKey.token],
      tokenType: json[ApiKey.tokenType],
      expiresIn: json[ApiKey.expiresIn]
      );
  }

  Map<String,dynamic>toJson(){
    return {
      ApiKey.token:token,
      ApiKey.tokenType:tokenType,
      ApiKey.expiresIn:expiresIn,
    };
  }

}