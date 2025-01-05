import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class OrderDelivaredRemoteDataSource {
  ApiConsumer api;

  OrderDelivaredRemoteDataSource({
    required this.api,
  });

  Future<dynamic>delivaryOrder(int id)async{
    return await api.delete('${EndPoints.orderDelivared}/$id');
  }

  
}