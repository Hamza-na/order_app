import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class RemoveFromFavoriteRemoteDataSource {
  ApiConsumer api;

  RemoveFromFavoriteRemoteDataSource({
    required this.api,
  });

  Future<dynamic>removeFromFavorite({required int productId})async{
    final response =await api.get('${EndPoints.removeFromFavorite}/$productId');

    return response;
  }

  
}
