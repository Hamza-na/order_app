import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class AddToFavoriteRemoteDataSource {
  ApiConsumer api;

  AddToFavoriteRemoteDataSource({
    required this.api,
  });

  Future<dynamic>addToFavorite({required int productId})async{
    final response =await api.get('${EndPoints.addToFavorite}/$productId');
    return response;
  }

  
}
