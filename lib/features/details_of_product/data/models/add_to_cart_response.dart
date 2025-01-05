// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';

class AddToCartResponse {
  String message;
  int numberOfProductsInCart;

  AddToCartResponse({
    required this.message,
    required this.numberOfProductsInCart,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      message: json[ApiKey.message],
      numberOfProductsInCart: json[ApiKey.numberOfProductsInCart],
    );
  }
}
