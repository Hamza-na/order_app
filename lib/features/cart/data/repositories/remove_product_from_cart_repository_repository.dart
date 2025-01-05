import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/cart/data/datasource/remove_product_from_cart_remote_data_source.dart';

class RemoveProductFromCartRepositoryRepository {
  RemoveProductFromCartRemoteDataSource removeProductFromCartRemoteDataSource;

  RemoveProductFromCartRepositoryRepository({required this.removeProductFromCartRemoteDataSource});

  Future<Either<Failure,dynamic>>removeProductFromCart({required int removeCartParams})async{
    try{
      final response = await removeProductFromCartRemoteDataSource.removeProductFromCart(removeCartParams);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage:e.errorModel.errorMessage));
    }
  }

}