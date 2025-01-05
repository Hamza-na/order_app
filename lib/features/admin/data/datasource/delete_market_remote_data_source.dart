// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class DeleteMarketRemoteDataSource {
  ApiConsumer api;


  DeleteMarketRemoteDataSource({
    required this.api,
  });

  Future<dynamic>deleteMarket({required int marketId}){
    final response = api.delete("${EndPoints.markets}/$marketId");
    return response;
  }


}
