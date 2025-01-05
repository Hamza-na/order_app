import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';

class ToUserRemoteDataSource {
  ApiConsumer api;

  ToUserRemoteDataSource({required this.api});

  Future<dynamic>toUser(int adminId)async{
    final response =await api.post("${EndPoints.toUser}/$adminId");
    return response;
  }


}