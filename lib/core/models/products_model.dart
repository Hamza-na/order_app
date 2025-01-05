import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/market_products_model.dart';

class ProductsModel {
  MarketProductsModel marketModel ;
  String ?base64Image
  ;
  ProductsModel({
    required this.marketModel,
     this.base64Image,
  });

  factory ProductsModel.fromJson(Map<String,dynamic>json){
    return ProductsModel(
      marketModel: MarketProductsModel.fromJson(json[ApiKey.market])
      , base64Image: json[ApiKey.image]);
  }

  
}
