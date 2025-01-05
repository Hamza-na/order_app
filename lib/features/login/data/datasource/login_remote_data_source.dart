

import 'package:dio/dio.dart';
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/databases/cache/cache_helper.dart';
import 'package:order_app/core/models/auth_body_model.dart';
import 'package:order_app/core/models/auth_response_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginRemoteDataSource {
  ApiConsumer api;

  LoginRemoteDataSource({
    required this.api,
  });

  Future<AuthResponseModel>login({required AuthBodyModel loginBodyModel})async{
      final fcmToken = SharedPrefHelper.getString('fcmToken');
    final response = await api.post(EndPoints.login,data: loginBodyModel.toJson(), options: Options(
        headers: {
          if (fcmToken != null) 'fcm_token': fcmToken, // Include FCM token in header if available
        },));
    print(response.toString());
    return AuthResponseModel.fromJson(response);
  }

}

