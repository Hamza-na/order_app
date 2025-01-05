import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/orders/data/datasource/order_delivared_remote_data_source.dart';

class OrderDelivaredRepository {
   OrderDelivaredRemoteDataSource orderDelivaredRemoteDataSource ;

  OrderDelivaredRepository({
    required this.orderDelivaredRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>delivaryOrder({required int id})async{
    try{
      final response = await orderDelivaredRemoteDataSource.delivaryOrder(id);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}