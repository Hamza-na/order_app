// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/products_model.dart';
import 'package:order_app/features/products/data/datasource/get_products_market_remote_data_source.dart';

class GetProductsMarketsRepository {
   GetProductsMarketRemoteDataSource getProductsMarketRemoteDataSource;


  GetProductsMarketsRepository({
    required this.getProductsMarketRemoteDataSource,
  });

  Future<Either<Failure,ProductsModel>>getProducts({required int getProductsParams})async{
    try{
    final response =await getProductsMarketRemoteDataSource.getProducts(params: getProductsParams) ;
    return Right(response);
    } on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

   
}
