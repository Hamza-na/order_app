// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/admin/data/models/product_body_model.dart';

class UpdateProductBodyModel extends ProductBodyModel {

  String method ;

  UpdateProductBodyModel({
    required this.method,
    required super .availableQuantity ,
    required super .description ,
    super .image ,
    required super .name ,
    required super .pirce ,
  });
  @override 
  Map<String,dynamic>toJson(){
    return{
      ApiKey.name:name,
      ApiKey.image:image,
      ApiKey.description:description,
      ApiKey.price:pirce,
      ApiKey.availableQuantity:availableQuantity,
      ApiKey.method:method
      
    };
  }
  
 }
