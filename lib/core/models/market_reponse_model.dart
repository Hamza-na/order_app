// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/market_model.dart';

class MarketReponseModel {
  String message;
  MarketModel marketModel;
  String base64Image ;
  MarketReponseModel({
    required this.message,
    required this.marketModel,
    required this.base64Image,
  });

  factory MarketReponseModel.fromJson(Map<String,dynamic>json){
      return MarketReponseModel(
        marketModel: MarketModel.fromJson(json[ApiKey.market]),
        base64Image: json[ApiKey.imageOfMarket],
        message: json[ApiKey.message]
        );
    }

  
}
