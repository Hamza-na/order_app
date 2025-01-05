// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class DeleteProductRemoteDataSource {
  ApiConsumer api;


  DeleteProductRemoteDataSource({
    required this.api,
  });

  Future<dynamic>deleteMarket({required int productId}){
    final response = api.delete("${EndPoints.products}/$productId");
    return response;
  }


}
