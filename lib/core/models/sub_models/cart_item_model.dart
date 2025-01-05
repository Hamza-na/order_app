import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/cart_product_model.dart';

class CartItemModel {
  List<CartProductModel> products;
  int bill;

  CartItemModel({
    required this.products,
    required this.bill
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      products: List<CartProductModel>.from(
        json[ApiKey.products].map((product) => CartProductModel.fromJson(product)),
      ),
      bill: json[ApiKey.bill],
    );
  }
}