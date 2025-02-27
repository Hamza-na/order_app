import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/sign_up/data/datasources/sign_up_remote_data_source.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/features/sign_up/data/models/sign_up_body_model.dart';
import 'package:order_app/features/sign_up/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {

  final SignUpRemoteDataSource signUpRemoteDataSource;

  SignUpRepositoryImpl({
    required this.signUpRemoteDataSource,
  });
@override
Future<Either<Failure, AuthResponseEntitiy>> signup({
  required SignUpBodyModel signUpBodyModel,
}) async {
  try {
    final response = await signUpRemoteDataSource.signup(
      signUpBodyModel: signUpBodyModel,
    );
    final entity = response.toAuthResponseEntitiy(response);
    return Right(entity);
  } on DioException catch (e) {
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


