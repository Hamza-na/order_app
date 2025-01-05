// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/orders_model.dart';

class GetOrdersRemoteDataSource {
  ApiConsumer api ;


  GetOrdersRemoteDataSource({
    required this.api,
  });

  Future<OrdersModel>getOrders()async{
    final response =await api.get(EndPoints.orders);
    return OrdersModel.fromJson(response);
  }

  
}
