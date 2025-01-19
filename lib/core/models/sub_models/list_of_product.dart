import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';

class ListOfProduct {
  final List<ProductModelOfResturantWithImage> listOfProduct;

  ListOfProduct({required this.listOfProduct});

  factory ListOfProduct.fromJson(List<dynamic> json) {
    return ListOfProduct(
      listOfProduct: json
          .map((product) => ProductModelOfResturantWithImage.fromJson(product))
          .toList(),
    );
  }
}
