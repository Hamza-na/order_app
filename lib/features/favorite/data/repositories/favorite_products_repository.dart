import 'package:dartz/dartz.dart';
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
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}