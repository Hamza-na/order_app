// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/products_model.dart';

class UpdateMarketResponse {
  String arMessage;
  String enMessage;
  ProductsModel productsModel ;


  UpdateMarketResponse({
    required this.arMessage,
    required this.enMessage,
    required this.productsModel,
  });

  factory UpdateMarketResponse.fromJson(Map<String,dynamic>json){
    return UpdateMarketResponse(
      arMessage: json[ApiKey.messageAr],
      enMessage: json[ApiKey.message],
      productsModel: json[ApiKey.products]);
  }
}
