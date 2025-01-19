import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/details_of_product/data/datasource/add_to_cart_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/models/add_and_remove_from_cart_response.dart';

class AddToCartRepository {
  AddToCartRemoteDataSource addToCartRemoteDataSource;

  AddToCartRepository({
    required this.addToCartRemoteDataSource,
  });

  Future<Either<Failure,AddAndRemoveFromCartResponse>>addToCart({required int addToCartParams})async{
    try{
      final response =await addToCartRemoteDataSource.addToCart(addToCartParams: addToCartParams);

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
