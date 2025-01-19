import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/cart/data/models/order_cart_model.dart';

class UpdateOrderRemoteDataSource {
  ApiConsumer api;

  UpdateOrderRemoteDataSource({required this.api});

  Future<OrderCartModel> updateOrder({required int orderId,required String location}) async {
    print(location);
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print(orderId);
    final response = await api.post("${EndPoints.orderUpdated}/$orderId",data: {
      ApiKey.method:"put",
      ApiKey.location:location
    });
    return OrderCartModel.fromJson(response);
  }
}