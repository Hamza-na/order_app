// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/cart_product_model.dart';

class CartProductModelWithImage {
  CartProductModel cartProductModel ;
  String ?image;

  CartProductModelWithImage({
    required this.cartProductModel,
    required this.image,
  });

  factory CartProductModelWithImage.fromJson(Map<String,dynamic>json){
   
      
      return CartProductModelWithImage(
        cartProductModel: CartProductModel.fromJson(json[ApiKey.product]),
         image: json[ApiKey.imageOfProduct]
         );

  }
  
}
