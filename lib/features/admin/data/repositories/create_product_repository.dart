import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/admin/data/datasource/create_product_remote_data_source.dart';
import 'package:order_app/features/admin/data/models/product_body_model.dart';

class CreateProductRepository {
  CreateProductRemoteDataSource createProductRemoteDataSource;


  CreateProductRepository({
    required this.createProductRemoteDataSource,
  });

 Future<Either<Failure,dynamic>>createProduct({required int marketId,required ProductBodyModel productBodyModel})async{
    try{
      final response =await createProductRemoteDataSource.createProduct(marketId:marketId,productBodyModel: productBodyModel);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
