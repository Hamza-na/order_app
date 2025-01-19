import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/cart_model.dart';

class GetCartRemoteDataSource {
  ApiConsumer api;

  GetCartRemoteDataSource({
    required this.api,
  });

  Future<CartModel>getCart()async{
    final response =await api.get(EndPoints.getCart);
    print(response);
    
    return CartModel.fromJson(response);
  }

  
}
