import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/settings/data/models/update_profile_body_model.dart';
import 'package:order_app/features/settings/data/models/update_profile_response_model.dart';

class UpdateProfileRemoteDataSource {
  ApiConsumer api;

  UpdateProfileRemoteDataSource({required this.api});

  Future<UpdateProfileResponseModel> updateProfile(UpdateProfileBodyModel updateProfileBodyModel) async {
    final response = await api.post(EndPoints.updateProfile, data: updateProfileBodyModel.toJson());
    return UpdateProfileResponseModel.fromJson(response);
  }
}