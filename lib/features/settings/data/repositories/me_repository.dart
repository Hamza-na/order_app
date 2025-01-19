import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';
import 'package:order_app/features/settings/data/datasource/me_remote_data_source.dart';

class MeRepository {
  final MeRemoteDataSource meRemoteDataSource;

  MeRepository({required this.meRemoteDataSource});

  Future<Either<Failure, UserModel>> me( ) async {
    try {
      final result = await meRemoteDataSource.me();
      return Right(result);
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