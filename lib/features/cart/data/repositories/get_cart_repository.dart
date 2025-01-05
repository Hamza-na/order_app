// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/cart/data/datasource/get_cart_remote_data_source.dart';
import 'package:order_app/core/models/cart_model.dart';

class GetCartRepository {
  GetCartRemoteDataSource getCartRemoteDataSource;

  GetCartRepository({
    required this.getCartRemoteDataSource,
  });

  Future<Either<Failure,CartModel>>getCart()async{
    try{
      final response =await getCartRemoteDataSource.getCart();
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
  
}
