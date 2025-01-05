import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/cart/data/datasource/delete_cart_remote_data_source.dart';

class DeleteCartRepository {
  DeleteCartRemoteDataSource deleteCartRemoteDataSource ;

  DeleteCartRepository({
    required this.deleteCartRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>deleteCart()async{
    try{
      final response =await deleteCartRemoteDataSource.deleteCart();
      return Right(response);
    } on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
  
}
