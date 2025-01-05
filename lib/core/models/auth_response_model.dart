import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/models/sub_models/access_token_model.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/core/models/sub_models/refresh_token_model.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';


class AuthResponseModel extends AuthResponseEntitiy {
  String message;

  AuthResponseModel(
      {required super.accessTokenEntitiy,
      required super.refreshTokenEntitiy,
      required super.userEntitiy,
      required this.message});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
        accessTokenEntitiy: AccessTokenModel.fromJson(json[ApiKey.accessToken]),
        refreshTokenEntitiy:
            RefreshTokenModel.fromJson(json[ApiKey.refreshToken]),
        userEntitiy: UserModel.fromJson(json[ApiKey.user]),
        message: json[ApiKey.message]);
  }

  AuthResponseEntitiy toAuthResponseEntitiy(
      AuthResponseModel model) {
    return AuthResponseEntitiy(
        accessTokenEntitiy: model.accessTokenEntitiy,
        refreshTokenEntitiy: model.refreshTokenEntitiy,
        userEntitiy: model.userEntitiy);
  }

}
