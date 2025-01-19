import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';

class OrdersModel {
  List<OrdersItemModel>? ordersListModel;

  OrdersModel({
    required this.ordersListModel,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    List<OrdersItemModel> list = [];
    if(json[ApiKey.orders]!= null)
    { for (var order in json[ApiKey.orders]) {
      list.add(OrdersItemModel.fromJson(order));
    }}
    return OrdersModel(
        ordersListModel: list
        );
  }
}
