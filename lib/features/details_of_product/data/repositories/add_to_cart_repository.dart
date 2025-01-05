import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/details_of_product/data/datasource/add_to_cart_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/models/add_to_cart_response.dart';

class AddToCartRepository {
  AddToCartRemoteDataSource addToCartRemoteDataSource;

  AddToCartRepository({
    required this.addToCartRemoteDataSource,
  });

  Future<Either<Failure,AddToCartResponse>>addToCart({required int addToCartParams})async{
    try{
      final response =await addToCartRemoteDataSource.addToCart(addToCartParams: addToCartParams);

      return Right(response);

    } on ServerException catch (e){
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
