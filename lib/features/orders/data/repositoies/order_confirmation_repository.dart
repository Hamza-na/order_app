import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/orders_model.dart';
import 'package:order_app/features/orders/data/datasource/order_confirmation_remote_data_source.dart';

class OrderConfirmationRepository {
  OrderConfirmationRemoteDataSource orderConfirmationRemoteDataSource ;

  OrderConfirmationRepository({
    required this.orderConfirmationRemoteDataSource,
  });

  Future<Either<Failure,OrdersModel>>orderConfirmation({required int orderId})async{
    try{
      final response =await orderConfirmationRemoteDataSource.orderConfirmation(orderId: orderId);
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
