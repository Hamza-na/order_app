import 'package:dio/dio.dart';
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/settings/data/models/update_profile_body_model.dart';
import 'package:order_app/features/settings/data/models/update_profile_response_model.dart';

class UpdateProfileRemoteDataSource {
  ApiConsumer api;

  UpdateProfileRemoteDataSource({required this.api});

  Future<UpdateProfileResponseModel> updateProfile(UpdateProfileBodyModel updateProfileBodyModel) async {
   FormData formData = FormData.fromMap({
    'name': updateProfileBodyModel.name,
    'location': updateProfileBodyModel.location,
    'image': updateProfileBodyModel.image != null
        ? await MultipartFile.fromFile(
            updateProfileBodyModel.image!.path,
            filename: updateProfileBodyModel.image!.path.split('/').last,
          )
        : null,
    '_method': 'put',
  });

  final response = await api.post(
    EndPoints.updateProfile,
    data: formData,
    options: Options(contentType: 'multipart/form-data'),
  );
    return UpdateProfileResponseModel.fromJson(response);
  }
}