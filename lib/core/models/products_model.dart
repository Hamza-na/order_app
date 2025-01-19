import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/list_of_product.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/market_sub_item_model.dart';
import 'package:order_app/features/shops/domain/entities/sub_entity.dart/market_sub_item_entity.dart';

class ProductsModel {
  MarketSubItemModel marketSubItemModel;
  ListOfProduct ?listOfProduct ;
  
  ProductsModel({
    required this.marketSubItemModel,
    required this.listOfProduct
  });

  factory ProductsModel.fromJson(Map<String,dynamic>json){
    
    return ProductsModel(
      marketSubItemModel: MarketSubItemModel.fromJson(json[ApiKey.market]),
      listOfProduct: ListOfProduct.fromJson(json[ApiKey.products])
      );
  }

  
}
