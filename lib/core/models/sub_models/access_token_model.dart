import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/entities/sub_entities/access_token_entitiy.dart';

class AccessTokenModel extends AccessTokenEntitiy {
  String tokenType ;
  
  
  AccessTokenModel({
    required super.token,
    required this.tokenType,
    required super.expiresIn,
    });

  factory AccessTokenModel.fromJson(Map<String,dynamic>json){
    return AccessTokenModel(
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