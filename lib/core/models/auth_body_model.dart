
import 'package:order_app/core/databases/api/end_points.dart';

class AuthBodyModel {
  String phoneNumber;
  AuthBodyModel({
    required this.phoneNumber,
    
  });

 

  Map<String, dynamic> toJson() {
    return {
      ApiKey.phoneNumber :phoneNumber,
    };
  }


}
