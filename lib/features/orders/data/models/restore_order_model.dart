// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';

class RestoreOrderModel {
  String message;
  OrdersItemModel ordersItemModel;

  RestoreOrderModel({
    required this.message,
    required this.ordersItemModel,
  });

  factory RestoreOrderModel.fromJson(Map<String,dynamic>json){
    return RestoreOrderModel(
    message: json[ApiKey.message], 
    ordersItemModel: OrdersItemModel.fromJson(json[ApiKey.order]));
  }

}
