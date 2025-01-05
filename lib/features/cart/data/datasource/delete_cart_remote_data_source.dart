import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class DeleteCartRemoteDataSource {
  ApiConsumer api;


  DeleteCartRemoteDataSource({
    required this.api,
  });

  Future<dynamic>deleteCart(){
    final response = api.delete(EndPoints.deleteCart);
    return response;
  }


}
