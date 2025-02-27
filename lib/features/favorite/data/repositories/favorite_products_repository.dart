import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/favorite/data/datasource/favorite_remote_data_source.dart';
import 'package:order_app/features/favorite/data/models/favorite_products_model.dart';

class FavoriteProductsRepository {
  FavoriteRemoteDataSource favoriteRemoteDataSource ;

  FavoriteProductsRepository({required this.favoriteRemoteDataSource});

  Future<Either<Failure, FavoriteProductsModel>> getFavoriteProducts() async {
    try {
      final response = await favoriteRemoteDataSource.getFavoriteProducts();
      return Right(response);
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