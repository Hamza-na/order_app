import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/admin/data/datasource/admin_response_remote_data_source.dart';

class AdminResponseRepository {
  AdminResponseRemoteDataSource adminResponseRemoteDataSource;


  AdminResponseRepository({
    required this.adminResponseRemoteDataSource,
  });

 Future<Either<Failure,dynamic>>adminResponse({required int orderId,required bool answer})async{
    try{
      final response =await adminResponseRemoteDataSource.adminResponse(orderId: orderId,answer: answer);
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
