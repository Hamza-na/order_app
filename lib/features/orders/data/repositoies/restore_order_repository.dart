// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/orders/data/datasource/restore_order_remote_data_source.dart';
import 'package:order_app/features/orders/data/models/restore_order_model.dart';

class RestoreOrderRepository {
  RestoreOrderRemoteDataSource restoreOrderRemoteDataSource ;

  RestoreOrderRepository({
    required this.restoreOrderRemoteDataSource,
  });

  Future<Either<Failure,RestoreOrderModel>>restoreOrder({required int id})async{
    try{
      final response =await restoreOrderRemoteDataSource.restoreOrder(id: id);
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
