import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/features/admin/data/models/order_noti_model.dart';

class NotificationResponseModel {
  List<OrderNotiModel>orderNotiModel;


  NotificationResponseModel({required this.orderNotiModel});


  factory NotificationResponseModel.fromJson(Map<String,dynamic>json){
    List<OrderNotiModel> noti = [] ;
    noti = List<OrderNotiModel>.from(
        json[ApiKey.notification].map((noti) => OrderNotiModel.fromJson(noti)),
      );
    return NotificationResponseModel(orderNotiModel: noti);
  }
  }
