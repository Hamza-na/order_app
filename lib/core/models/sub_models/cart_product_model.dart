import 'package:order_app/core/databases/api/end_points.dart';

class CartProductModel {
  int productId;
  String name;
  String? image;
  String description;
  int marketId;
  int priceForOnePiece;
  int quantity;
  int totalPrice;

  CartProductModel({
    required this.productId,
    required this.name,
    this.image,
    required this.description,
    required this.marketId,
    required this.priceForOnePiece,
    required this.quantity,
    required this.totalPrice,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
        productId: json[ApiKey.productId],
        name: json[ApiKey.name],
        description: json[ApiKey.description],
        marketId: json[ApiKey.marketId],
        priceForOnePiece: json[ApiKey.priceForOnePiece],
        quantity: json[ApiKey.quantity],
        totalPrice: json[ApiKey.totalPrice],
        image: json[ApiKey.image]
        );
  }
}
