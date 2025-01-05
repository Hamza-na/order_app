import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';

class OrderCartModel {
  String message;
  OrdersItemModel ordersItemModel;

  OrderCartModel({
    required this.message,
    required this.ordersItemModel,
  });

  factory OrderCartModel.fromJson(Map<String, dynamic> json) {
    return OrderCartModel(
      message: json['message'],
      ordersItemModel: OrdersItemModel.fromJson(json[ApiKey.order]),
    );
  }
}