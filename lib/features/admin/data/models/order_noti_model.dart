// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/cart_item_model.dart';

class OrderNotiModel {
  int id;
  int userId;
  int orderId;
  CartItemModel cartItemModel ;
  String location;
  int updated;
  String createdAt;
  String updatedAt;

  OrderNotiModel({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.cartItemModel,
    required this.location,
    required this.updated,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderNotiModel.fromJson(Map<String,dynamic>json){
    return OrderNotiModel(
      id: json[ApiKey.id],
       userId: json[ApiKey.userId],
        orderId: json[ApiKey.orderId], 
        cartItemModel: CartItemModel.fromJson(json[ApiKey.cart]),
         location: json[ApiKey.location],
          updated: json[ApiKey.updated], 
          createdAt: json[ApiKey.createdAt],
           updatedAt: json[ApiKey.updatedAt]);
  }

  
}
