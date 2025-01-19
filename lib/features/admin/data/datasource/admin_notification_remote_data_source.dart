// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/admin/data/models/notification_response_model.dart';

class AdminNotificationRemoteDataSource {
  ApiConsumer api;


  AdminNotificationRemoteDataSource({
    required this.api,
  });

  Future<NotificationResponseModel>adminNotification()async{
    final response = await api.get(EndPoints.adminNotification);
    return NotificationResponseModel.fromJson(response);
  }

}
