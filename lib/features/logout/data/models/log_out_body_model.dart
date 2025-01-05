
import 'package:order_app/core/databases/api/end_points.dart';

class LogOutBodyModel {
  String refreshToken;

  LogOutBodyModel({
    required this.refreshToken,
  });

  

  Map<String,dynamic>toJson(){
    return {
      ApiKey.refreshToken:refreshToken
    };
  }

}
