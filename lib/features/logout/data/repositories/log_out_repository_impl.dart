// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/logout/data/datasource/logout_remote_data_source.dart';
import 'package:order_app/features/logout/data/models/log_out_body_model.dart';
import 'package:order_app/features/logout/data/models/log_out_response_model.dart';

class LogOutRepositoryImpl  {

  LogOutRemoteDataSource logoutRemoteDataSource;

  LogOutRepositoryImpl({
    required this.logoutRemoteDataSource,
  });

  Future<Either<Failure,LogOutResponseModel>>logout({required LogOutBodyModel logOutBodyModel}) async{
    try{
    final response =await  logoutRemoteDataSource.logout( logOutBodyModel);
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
