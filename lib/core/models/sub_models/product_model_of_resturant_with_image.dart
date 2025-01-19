// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant.dart';

class ProductModelOfResturantWithImage {
  ProductModelOfResturant productModelOfResturant ;
  String ?image;

  ProductModelOfResturantWithImage({
    required this.productModelOfResturant,
    required this.image,
  });

  factory ProductModelOfResturantWithImage.fromJson(Map<String,dynamic>json){
    
     
    return ProductModelOfResturantWithImage(
      productModelOfResturant: ProductModelOfResturant.fromJson(json[ApiKey.product]),
       image: json[ApiKey.imageOfProduct]
       );
  }



  
}
