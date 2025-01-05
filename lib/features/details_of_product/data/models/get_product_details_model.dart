// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant.dart';

class GetProductDetailsModel {
  ProductModelOfResturant productModelOfResturant;

  GetProductDetailsModel({
    required this.productModelOfResturant,
  });

  factory GetProductDetailsModel.fromJson(Map<String,dynamic>json){
    return GetProductDetailsModel(productModelOfResturant: ProductModelOfResturant.fromJson(json[ApiKey.product]));
  }

  
}
