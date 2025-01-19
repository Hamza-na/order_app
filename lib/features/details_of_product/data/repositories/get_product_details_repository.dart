import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';
import 'package:order_app/features/details_of_product/data/datasource/get_product_details_remote_data_source.dart';

class GetProductDetailsRepository  {

  GetProductDetailsRemoteDataSource getProductDetailsRemoteDataSource;
  GetProductDetailsRepository({required this.getProductDetailsRemoteDataSource});


  Future<Either<Failure,ProductModelOfResturantWithImage>>getProductDetails({required int productParams})async{
    try{
      final response = await getProductDetailsRemoteDataSource.getProducts(productParams: productParams);
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
    return Left(Failure(errMessage: e.toString(),arErrMessage:"Exception" ));
  }
  }
}