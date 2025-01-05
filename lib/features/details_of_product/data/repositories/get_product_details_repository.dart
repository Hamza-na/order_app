import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/details_of_product/data/datasource/get_product_details_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/models/get_product_details_model.dart';

class GetProductDetailsRepository  {

  GetProductDetailsRemoteDataSource getProductDetailsRemoteDataSource;
  GetProductDetailsRepository({required this.getProductDetailsRemoteDataSource});


  Future<Either<Failure,GetProductDetailsModel>>getProductDetails({required int productParams})async{
    try{
      final response = await getProductDetailsRemoteDataSource.getProducts(productParams: productParams);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}