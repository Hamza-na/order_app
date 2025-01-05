import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/orders_list_model.dart';

class OrdersModel {
  OrdersListModel ordersListModel;

  OrdersModel({
    required this.ordersListModel,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
        ordersListModel: OrdersListModel.fromJson(json[ApiKey.orders]));
  }
}
