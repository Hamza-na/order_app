
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/logout/data/models/log_out_body_model.dart';
import 'package:order_app/features/logout/data/models/log_out_response_model.dart';

class LogOutRemoteDataSource {
  ApiConsumer api;

  LogOutRemoteDataSource({
    required this.api,
  });

  Future<LogOutResponseModel>logout(LogOutBodyModel logOutBodyModel)async{

    final response = await api.post(EndPoints.logOut,data: logOutBodyModel.toJson());

    return LogOutResponseModel.fromJson(response);
  }
  
}
