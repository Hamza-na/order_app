import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/adress/data/datasource/update_order_remote_data_source.dart';

class UpdateOrderRepository {
  UpdateOrderRemoteDataSource updateOrderRemoteDataSource;

  UpdateOrderRepository({required this.updateOrderRemoteDataSource});

  Future<Either<Failure,dynamic>>updateOrder({required int orderId})async{
    try{
      final response = await updateOrderRemoteDataSource.updateOrder(orderId: orderId);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage:e.errorModel.errorMessage));
    }
  }

}