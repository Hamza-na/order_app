import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/shops/data/models/markets_models.dart';

class SearchMarketsRemoteDataSource {
  ApiConsumer api;

  SearchMarketsRemoteDataSource({required this.api});

  Future<MarketsModels> getSearchMarkets(String marketName) async {
    final response = await api.get(EndPoints.searchForMarkets,queryParameters: {
      "name":marketName
    });
    print(response.toString());
    return MarketsModels.fromJson(response);
  }
}