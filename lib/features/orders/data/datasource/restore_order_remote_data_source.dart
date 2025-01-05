import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/orders/data/models/restore_order_model.dart';

class RestoreOrderRemoteDataSource {
  ApiConsumer api ;


  RestoreOrderRemoteDataSource({
    required this.api,
  });

  Future<RestoreOrderModel>restoreOrder({required int id})async{
    final response =await api.get('${EndPoints.restoreOrder}/$id');
    return RestoreOrderModel.fromJson(response);
  }
}