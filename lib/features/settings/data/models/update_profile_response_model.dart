import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';

class UpdateProfileResponseModel {
  String messageEn;
  String messageAr;
  UserModel userModel;

  UpdateProfileResponseModel({
    required this.messageEn,
    required this.messageAr,
    required this.userModel,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      messageEn: json[ApiKey.message],
      messageAr: json[ApiKey.messageAr],
      userModel: UserModel.fromJson(json[ApiKey.user]),
    );
  }



}
