// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';

class FavoriteProductsModel {
  List<ProductModelOfResturantWithImage> ?favoriateProductsModel;

  FavoriteProductsModel({
    required this.favoriateProductsModel,
  });

  factory FavoriteProductsModel.fromJson(Map<String,dynamic>json){
     List<ProductModelOfResturantWithImage> favoriateProductsModel =  List<ProductModelOfResturantWithImage>.from(
        json[ApiKey.favoriteProducts].map((product) => ProductModelOfResturantWithImage.fromJson(product)),
      );
      return FavoriteProductsModel(favoriateProductsModel: favoriateProductsModel);
  }

  
}
