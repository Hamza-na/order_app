// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/orders/data/datasource/get_orders_remote_data_source.dart';
import 'package:order_app/core/models/orders_model.dart';

class GetOrdersRepository {
  GetOrdersRemoteDataSource getOrdersRemoteDataSource ;

  GetOrdersRepository({
    required this.getOrdersRemoteDataSource,
  });

  Future<Either<Failure,OrdersModel>>getOrders()async{
    try{
      final response =await getOrdersRemoteDataSource.getOrders();
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
