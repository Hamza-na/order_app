import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/admin/data/datasource/update_product_remote_data_source.dart';
import 'package:order_app/features/admin/data/models/update_product_body_model.dart';

class UpdateProductRepository {
  UpdateProductRemoteDataSource updateProductRemoteDataSource;


  UpdateProductRepository({
    required this.updateProductRemoteDataSource,
  });

 Future<Either<Failure,dynamic>>updateProduct({required int productId,required UpdateProductBodyModel productBodyModel})async{
    try{
      final response =await updateProductRemoteDataSource.updateProduct(productId:productId,productBodyModel: productBodyModel);
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
