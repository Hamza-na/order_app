import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class OrderConfirmationRemoteDataSource {
  ApiConsumer api;

  OrderConfirmationRemoteDataSource({
    required this.api,
  });

  Future<dynamic>orderConfirmation({required int orderId})async{
    return await api.get('${EndPoints.orderDelivared}/$orderId');
  }

  
}