// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/products/data/datasource/add_to_favorite_remote_data_source.dart';

class AddToFavoriteRepository {
   AddToFavoriteRemoteDataSource addToFavoriteRemoteDataSource;


  AddToFavoriteRepository({
    required this.addToFavoriteRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>addToFavorite({required int productId})async{
    try{
    final response =await addToFavoriteRemoteDataSource.addToFavorite(productId: productId) ;
    return Right(response);
    } on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
