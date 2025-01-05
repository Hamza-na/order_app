// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/cart_product_model.dart';

class FavoriteProductsModel {
  List<CartProductModel> ?favoriateProductsModel;

  FavoriteProductsModel({
    required this.favoriateProductsModel,
  });

  factory FavoriteProductsModel.fromJson(Map<String,dynamic>json){
     List<CartProductModel> favoriateProductsModel =  List<CartProductModel>.from(
        json[ApiKey.favoriteProducts].map((product) => CartProductModel.fromJson(product)),
      );
      return FavoriteProductsModel(favoriateProductsModel: favoriateProductsModel);
  }

  
}
