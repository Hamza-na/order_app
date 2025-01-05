// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/market_reponse_model.dart';
import 'package:order_app/core/models/sub_models/market_body_model.dart';

class CreateMarketRemoteDataSource {
  ApiConsumer api;

  CreateMarketRemoteDataSource({
    required this.api,
  });

  Future<MarketReponseModel>createMarket({required MarketBodyModel createMarketBodyModel})
  async{
    final response =await api.post(EndPoints.markets,data: createMarketBodyModel.toJson());
    return MarketReponseModel.fromJson(response);
  }
  
}
