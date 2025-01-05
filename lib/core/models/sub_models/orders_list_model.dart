// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';

class OrdersListModel {
 List<OrdersItemModel> ordersListModel;

  OrdersListModel({
    required this.ordersListModel,
  });

  factory OrdersListModel.fromJson(Map<String,dynamic>json){
    List<OrdersItemModel> list = [];

    for (var order in json[ApiKey.orders]) {
      list.add(OrdersItemModel.fromJson(order));
    }
    return OrdersListModel(ordersListModel: list);
  }
}
