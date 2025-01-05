// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class RemoveOrderRemoteDataSource {
  ApiConsumer api;

  RemoveOrderRemoteDataSource({
    required this.api,
  });

  Future<dynamic>removeOrder(int id)async{
    return await api.delete('${EndPoints.removeOrder}/$id');
  }

  
}
