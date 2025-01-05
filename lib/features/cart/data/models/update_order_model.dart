import 'package:order_app/core/databases/api/end_points.dart';

class UpdateOrderModel {
  String location ;
  String method ;


  UpdateOrderModel({required this.location,required this.method});

  Map<String,dynamic>toJson(){
    return {
      ApiKey.location: location,
      ApiKey.method:method
    };
  }
}