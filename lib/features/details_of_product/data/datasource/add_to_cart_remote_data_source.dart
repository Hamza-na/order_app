import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/details_of_product/data/models/add_to_cart_response.dart';

class AddToCartRemoteDataSource {
  ApiConsumer api;

  AddToCartRemoteDataSource({
    required this.api,
  });

  Future<AddToCartResponse>addToCart({required int addToCartParams})async{
    final response =await api.get('${EndPoints.addToCart}/$addToCartParams');
    return AddToCartResponse.fromJson(response);
  }

}
