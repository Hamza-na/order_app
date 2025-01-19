import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/admin/data/datasource/admin_notification_remote_data_source.dart';
import 'package:order_app/features/admin/data/models/notification_response_model.dart';

class AdminNotificationRepository {
  AdminNotificationRemoteDataSource adminNotificationRemoteDataSource;


  AdminNotificationRepository({
    required this.adminNotificationRemoteDataSource,
  });

 Future<Either<Failure,NotificationResponseModel>>adminNotification()async{
    try{
      final response =await adminNotificationRemoteDataSource.adminNotification();
      return Right(response);
    }on DioException catch (e) {
    try {
      handleDioException(e);
    } catch (exception) {
      if (exception is ServerException) {
        return Left(Failure(errMessage: exception.errorModel.errorMessage,arErrMessage:exception.errorModel.arErrorMessage ));
      }
    }
    return Left(Failure(errMessage: "An unexpected error occurred.",arErrMessage: "خطأ غير معروف"));
  } catch (e) {
    return Left(Failure(errMessage: e.toString(),arErrMessage:"Exception" ));
  }
  }
}
