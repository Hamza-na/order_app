import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/cart_model.dart';

class OrdersItemModel {
  int id;
  int userId;
  CartModel cartModel;
  String location;
  String status;
  String rejectedAt;
  String createdAt;
  String updatedAt;

  OrdersItemModel(
      {required this.cartModel,
      required this.createdAt,
      required this.id,
      required this.location,
      required this.rejectedAt,
      required this.status,
      required this.updatedAt,
      required this.userId});

  factory OrdersItemModel.fromJson(Map<String, dynamic> json) {
    return OrdersItemModel(
        cartModel: CartModel.fromJson(json[ApiKey.cart]),
        createdAt: json[ApiKey.createdAt],
        id: json[ApiKey.id],
        location: json[ApiKey.location],
        rejectedAt: json[ApiKey.rejectedAt],
        status: json[ApiKey.status],
        updatedAt: json[ApiKey.updatedAt],
        userId: json[ApiKey.userId]);
  }
}
