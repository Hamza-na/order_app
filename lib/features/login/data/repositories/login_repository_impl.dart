import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/auth_body_model.dart';
import 'package:order_app/features/login/data/datasource/login_remote_data_source.dart';
import 'package:order_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {

  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
  });
 @override
  Future<Either<Failure,AuthResponseEntitiy>>login({required AuthBodyModel loginBodyModel}) async {
    try {
        final response = await loginRemoteDataSource.login(
        loginBodyModel: loginBodyModel,
      );
      final entity = response.toAuthResponseEntitiy(response);
      print("!!!!!!!!!!!!!!!!!!!!!");
      print(entity.toString());
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!");
      return Right(entity);
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


