import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class OrderInWayRemoteDataSource {
  ApiConsumer api;

  OrderInWayRemoteDataSource({
    required this.api,
  });

  Future<dynamic>orderInWay()async{
    return await api.get('${EndPoints.orderInWay}');
  }

  
}