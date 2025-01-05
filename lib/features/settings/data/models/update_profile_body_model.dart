import 'dart:io';

import 'package:order_app/core/databases/api/end_points.dart';

class UpdateProfileBodyModel {
  final String name;
  final String? location;
  final File? image;
  final String method;
  UpdateProfileBodyModel({
   required this.name,
    required this.method,
    this.location,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.location: location,
      ApiKey.image: image,
      ApiKey.method: image,
    };
  }
}