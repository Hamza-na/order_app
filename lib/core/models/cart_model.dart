import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/cart_item_model.dart';

class CartModel {
  CartItemModel ?cartItemModel ;

  CartModel({
    required this.cartItemModel,
  });

  factory CartModel.fromJson(Map<String,dynamic>json){
    return CartModel(cartItemModel: CartItemModel.fromJson(json[ApiKey.cart]));
  }
  
}
