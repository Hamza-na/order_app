import 'package:order_app/core/models/sub_models/product_model_of_resturant.dart';

class ListOfProduct {
  final List<ProductModelOfResturant> listOfProduct;

  ListOfProduct({required this.listOfProduct});

  factory ListOfProduct.fromJson(List<dynamic> json) {
    return ListOfProduct(
      listOfProduct: json
          .map((product) => ProductModelOfResturant.fromJson(product))
          .toList(),
    );
  }
}
