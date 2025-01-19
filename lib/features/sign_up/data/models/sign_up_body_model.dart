// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:order_app/core/databases/api/end_points.dart';

import 'package:order_app/core/models/auth_body_model.dart';

class SignUpBodyModel extends AuthBodyModel {
  String name;
  String phoneNumberConfirmation;
  String ?location;
  File ?image;

  SignUpBodyModel({
    required super.phoneNumber,
    required this.name,
    required this.phoneNumberConfirmation,
    this.location,
    this.image,
  });

  @override
  Map<String,dynamic>toJson(){
    final Map<String, dynamic> data= {
      ApiKey.name:name,
      ApiKey.phoneNumber:phoneNumber,
      ApiKey.phoneNumberConfirmation:phoneNumberConfirmation,
      ApiKey.location:location,
    };

    if (image != null) {
      data[ApiKey.image] = MultipartFile.fromFileSync(image!.path);
    }
    return data ;
  }
  
}
