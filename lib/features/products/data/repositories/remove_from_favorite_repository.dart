// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/products/data/datasource/remove_from_favorite_remote_data_source.dart';

class RemoveFromFavoriteRepository {
   RemoveFromFavoriteRemoteDataSource removeFromFavoriteRemoteDataSource;


  RemoveFromFavoriteRepository({
    required this.removeFromFavoriteRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>removeFromfavorite({required int productId})async{
    try{
    final response =await removeFromFavoriteRemoteDataSource.removeFromFavorite(productId: productId) ;
    return Right(response);
    } on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

}
