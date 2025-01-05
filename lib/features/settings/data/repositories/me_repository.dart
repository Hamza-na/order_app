import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';
import 'package:order_app/features/settings/data/datasource/me_remote_data_source.dart';
import 'package:order_app/features/settings/data/datasource/update_profile_remote_data_source.dart';
import 'package:order_app/features/settings/data/models/update_profile_body_model.dart';
import 'package:order_app/features/settings/data/models/update_profile_response_model.dart';

class MeRepository {
  final MeRemoteDataSource meRemoteDataSource;

  MeRepository({required this.meRemoteDataSource});

  Future<Either<Failure, UserModel>> me( ) async {
    try {
      final result = await meRemoteDataSource.me();
      return Right(result);
    } on ServerException catch(e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}