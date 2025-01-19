import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class ToAdminRemoteDataSource {
  ApiConsumer api;

  ToAdminRemoteDataSource({required this.api});

  Future<dynamic>toAdmin(int userId)async{
    final response =await api.get("${EndPoints.toAdmin}/$userId");
    return response;
  }


}