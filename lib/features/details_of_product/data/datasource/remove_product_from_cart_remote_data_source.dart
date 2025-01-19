import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/details_of_product/data/models/add_and_remove_from_cart_response.dart';

class RemoveProductFromCartRemoteDataSource {
  ApiConsumer api;

  RemoveProductFromCartRemoteDataSource({
    required this.api,
  });

  Future<AddAndRemoveFromCartResponse>removeProductFromCart(int params)async{
    final respone = await api.get('${EndPoints.removeProductFromCart}/$params');
    return  AddAndRemoveFromCartResponse.fromJson(respone);
  }

  

}
