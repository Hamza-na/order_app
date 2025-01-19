import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/settings/data/datasource/update_profile_remote_data_source.dart';
import 'package:order_app/features/settings/data/models/update_profile_body_model.dart';
import 'package:order_app/features/settings/data/models/update_profile_response_model.dart';

class UpdateProfileRepository {
  final UpdateProfileRemoteDataSource updateProfileRemoteDataSource;

  UpdateProfileRepository({required this.updateProfileRemoteDataSource});

  Future<Either<Failure, UpdateProfileResponseModel>> updateProfile(UpdateProfileBodyModel user) async {
    try {
      final result = await updateProfileRemoteDataSource.updateProfile(user);
      return Right(result);
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