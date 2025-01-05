import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/shops/data/models/markets_models.dart';

class MarketsRemoteDataSource {
  ApiConsumer api;

  MarketsRemoteDataSource({
    required this.api,
  });

  Future<MarketsModels>getMarkets()async{
    final response =await api.get(EndPoints.markets);
    print(
    response.toString()
    );
    return MarketsModels.fromJson(response);
  }
}