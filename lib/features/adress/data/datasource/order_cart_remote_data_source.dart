import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class OrderCartRemoteDataSource {
  ApiConsumer api;

  OrderCartRemoteDataSource({required this.api});

  Future<dynamic> orderCart({required String location}) async {
    final response = await api.post(EndPoints.orderCart,data: {
      ApiKey.location :location
    });
    return response;
  }
}