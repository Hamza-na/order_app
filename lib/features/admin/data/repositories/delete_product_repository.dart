// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/admin/data/datasource/delete_product_remote_data_source.dart';

class DeleteProductRepository {
  DeleteProductRemoteDataSource deleteProductRemoteDataSource ;

  DeleteProductRepository({
    required this.deleteProductRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>deleteProduct({required int productId
  })async{
    try{
      final response =await deleteProductRemoteDataSource.deleteMarket(productId:productId);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
  
}
