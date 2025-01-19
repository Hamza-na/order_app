import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/cart_product_model_with_image.dart';

class CartItemModel {
  List<CartProductModelWithImage> ?products;
  int bill;
  int deliveryCost;
  int totalBill ;
  int delivareyTime;


  CartItemModel({
    required this.products,
    required this.bill,
    required this.delivareyTime,
    required this.deliveryCost,
    required this.totalBill,
  
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      products: json[ApiKey.products]!=null? List<CartProductModelWithImage>.from(
        json[ApiKey.products].map((product) => CartProductModelWithImage.fromJson(product)),
      ):null,
      bill: json[ApiKey.bill],
      delivareyTime:json[ApiKey.delivareyTime] ,
      deliveryCost: json[ApiKey.deliveryCost],
      totalBill:json[ApiKey.totalBill] ,
    );
  }
}