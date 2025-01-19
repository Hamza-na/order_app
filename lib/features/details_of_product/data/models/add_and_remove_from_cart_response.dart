// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';

class AddAndRemoveFromCartResponse {
  String message;
  int numberOfProductsInCart;
  int availableQuantity ; 
  int quantityInCart;
  int totalPrice;

  AddAndRemoveFromCartResponse({
    required this.message,
    required this.numberOfProductsInCart,
    required this.availableQuantity,
    required this.quantityInCart,
    required this.totalPrice,
  });

  factory AddAndRemoveFromCartResponse.fromJson(Map<String, dynamic> json) {
    return AddAndRemoveFromCartResponse(
      message: json[ApiKey.message],
      numberOfProductsInCart: json[ApiKey.numberOfProductsInCart],
      availableQuantity: json[ApiKey.availableQuantity],
      quantityInCart: json[ApiKey.quantityInCart],
      totalPrice: json[ApiKey.totalPrice],
    );
  }
}
