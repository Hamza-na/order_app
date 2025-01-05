// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/orders/data/datasource/remove_order_remote_data_source.dart';

class RemoveOrderRepository {
  RemoveOrderRemoteDataSource removeOrderRemoteDataSource ;

  RemoveOrderRepository({
    required this.removeOrderRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>removeOrder({required int id})async{
    try{
      final response = await removeOrderRemoteDataSource.removeOrder(id);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
