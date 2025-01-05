import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class RemoveProductFromCartRemoteDataSource {
  ApiConsumer api;

  RemoveProductFromCartRemoteDataSource({
    required this.api,
  });

  Future<dynamic>removeProductFromCart(int params)async{
    return  await api.get('${EndPoints.removeProductFromCart}/$params');
  }

  

}
