// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/orders_model.dart';
import 'package:order_app/features/orders/data/datasource/order_confirmation_remote_data_source.dart';

class OrderConfirmationRepository {
  OrderConfirmationRemoteDataSource orderConfirmationRemoteDataSource ;

  OrderConfirmationRepository({
    required this.orderConfirmationRemoteDataSource,
  });

  Future<Either<Failure,OrdersModel>>orderConfirmation({required int orderId})async{
    try{
      final response =await orderConfirmationRemoteDataSource.orderConfirmation(orderId: orderId);
      return Right(response);
    }on ServerException catch (e){
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
