import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
