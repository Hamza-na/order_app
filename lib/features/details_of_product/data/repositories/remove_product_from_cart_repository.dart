import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/details_of_product/data/datasource/remove_product_from_cart_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/models/add_and_remove_from_cart_response.dart';

class RemoveProductFromCartRepository {
  RemoveProductFromCartRemoteDataSource removeProductFromCartRemoteDataSource;

  RemoveProductFromCartRepository({required this.removeProductFromCartRemoteDataSource});

  Future<Either<Failure,AddAndRemoveFromCartResponse>>removeProductFromCart({required int removeCartParams})async{
    try{
      final response = await removeProductFromCartRemoteDataSource.removeProductFromCart(removeCartParams);
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
    print("okkkkk");
    return Left(Failure(errMessage: e.toString(),arErrMessage:"Exception" ));
  }
  }

}