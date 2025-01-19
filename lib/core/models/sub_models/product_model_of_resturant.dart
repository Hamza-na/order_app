import 'package:order_app/core/databases/api/end_points.dart';

class ProductModelOfResturant {
  int id;
  String createAt;
  String updatedAt;
  int marketId;
  String name;
  int price;
  int availableQuantity;
  String descrption;
  String? image;
  int countInCart;

  // Add cartQuantity for frontend-only use
  int cartQuantity;

  ProductModelOfResturant({
    required this.name,
    required this.price,
    required this.descrption,
    required this.id,
    required this.createAt,
    required this.updatedAt,
    required this.marketId,
    required this.availableQuantity,
    this.image,
     required this.countInCart,
    this.cartQuantity = 0, // Default to 0
  });

  factory ProductModelOfResturant.fromJson(Map<String, dynamic> json) {
    return ProductModelOfResturant(
      name: json[ApiKey.name],
      price: json[ApiKey.price],
      descrption: json[ApiKey.description],
      id: json[ApiKey.id],
      createAt: json[ApiKey.createdAt],
      updatedAt: json[ApiKey.updatedAt],
      marketId: json[ApiKey.marketId],
      image: json[ApiKey.image],
      availableQuantity: json[ApiKey.availableQuantity],
      countInCart: json[ApiKey.countInCart],
      cartQuantity: 0, // Initialize to 0 when parsing
    );
  }
}
