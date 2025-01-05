// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/market_body_model.dart';
import 'package:order_app/features/admin/data/models/update_market_response.dart';

class UpdateMarketRemoteDataSource {
  ApiConsumer api;

  UpdateMarketRemoteDataSource({
    required this.api,
  });

  Future<UpdateMarketResponse>updateMarket({required MarketBodyModel marketBodyModel,required int marketId})
  async{
    final response =await api.post("${EndPoints.markets}/$marketId",data: marketBodyModel.toJson());
    return UpdateMarketResponse.fromJson(response);
  }
  
}
