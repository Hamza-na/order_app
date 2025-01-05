import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/list_of_product.dart';

class MarketProductsModel {
  int id ;
  String name;
  String location;
  String description;
  String ?image;
  String createdAt;
  String updatedAt;
  ListOfProduct listOfProduct;

  MarketProductsModel({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.listOfProduct
  });

  factory MarketProductsModel.fromJson(Map<String, dynamic> json) {
    return MarketProductsModel(
      id: json[ApiKey.id],
      listOfProduct: ListOfProduct.fromJson(json[ApiKey.products]),
        name: json[ApiKey.name],
        location: json[ApiKey.location],
        description: json[ApiKey.description],
        image: json[ApiKey.image],
        createdAt: json[ApiKey.createdAt],
        updatedAt: json[ApiKey.createdAt]);
  }
  
}
