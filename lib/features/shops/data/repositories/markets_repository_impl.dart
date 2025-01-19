
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/shops/data/datasource/markets_remote_data_source.dart';
import 'package:order_app/features/shops/data/models/markets_models.dart';
import 'package:order_app/features/shops/domain/repositoies/markets_repository.dart';

class MarketsRepositoryImpl extends MarketsRepository {
  MarketsRemoteDataSource marketsRemoteDataSource;

  MarketsRepositoryImpl({
    required this.marketsRemoteDataSource,
  });
  
  @override
  Future<Either<Failure,MarketsModels>>getMarkets()async{
    try{
      final response =await marketsRemoteDataSource.getMarkets();

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
