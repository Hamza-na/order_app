// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class AdminResponseRemoteDataSource {
  ApiConsumer api;


  AdminResponseRemoteDataSource({
    required this.api,
  });

  Future<dynamic>adminResponse({required bool answer,required int orderId})async{
    final response = await api.post('${EndPoints.adminResponse}/$orderId',queryParameters: {
      'approval':answer
    });
    return response;
  }

}
