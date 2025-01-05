import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';

class MeRemoteDataSource {
   ApiConsumer api;

  MeRemoteDataSource({required this.api});

  Future<UserModel> me() async {
    final response = await api.get(EndPoints.me,);
    return UserModel.fromJson(response);
  }
}