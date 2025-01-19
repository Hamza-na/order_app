import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/databases/cache/cache_helper.dart';
import 'package:order_app/core/models/auth_response_model.dart';
import 'package:order_app/features/sign_up/data/models/sign_up_body_model.dart';

class SignUpRemoteDataSource {
  ApiConsumer api;

  SignUpRemoteDataSource({
    required this.api,
  });

  Future<AuthResponseModel>signup({required SignUpBodyModel signUpBodyModel})async{
  final firebase =  FirebaseMessaging.instance;
  await firebase.requestPermission();
  final fcmToken =await firebase.getToken();


    await SharedPrefHelper.setData('fcmToken', fcmToken);
    final response = await api.post(EndPoints.signUp,data: signUpBodyModel.toJson(), options: Options(
        headers: {
          if (fcmToken != null) 'fcm_token': fcmToken, // Include FCM token in header if available
        },),isFormData: true);
        
  
    return AuthResponseModel.fromJson(response);
  }

}
