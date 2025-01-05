// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant.dart';

class CreateProductModel {
  String arMessage;
  String enMessage ;
  ProductModelOfResturant productModelOfResturant;

  CreateProductModel({
    required this.arMessage,
    required this.enMessage,
    required this.productModelOfResturant
  });

  factory CreateProductModel.fromJson(Map<String,dynamic>json){
    return CreateProductModel(
      arMessage: json[ApiKey.messageAr],
      enMessage: json[ApiKey.message],
      productModelOfResturant: ProductModelOfResturant.fromJson(json[ApiKey.product]));
  }


}
