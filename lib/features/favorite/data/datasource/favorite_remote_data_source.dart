import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/favorite/data/models/favorite_products_model.dart';

class FavoriteRemoteDataSource {
  ApiConsumer api;


  FavoriteRemoteDataSource({
    required this.api,
  });

  Future<FavoriteProductsModel> getFavoriteProducts() async {
    final response = await api.get(EndPoints.favoriteProducts);
    return FavoriteProductsModel.fromJson(response);
  }



}