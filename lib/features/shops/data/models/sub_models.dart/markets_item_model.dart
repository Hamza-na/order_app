import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/market_sub_item_model.dart';
class MarketsItemModel {
  MarketSubItemModel marketItem ;
  String ?base64imgae ;

  MarketsItemModel({required this.marketItem, this.base64imgae});

  factory MarketsItemModel.fromJson(Map<String,dynamic>json){
    return MarketsItemModel(
      marketItem: MarketSubItemModel.fromJson(json[ApiKey.market])
    , base64imgae: json[ApiKey.image]);
  }

} 