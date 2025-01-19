import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/market_reponse_model.dart';
import 'package:order_app/core/models/sub_models/market_body_model.dart';
import 'package:order_app/features/admin/data/datasource/create_market_remote_data_source.dart';

class CreateMarketRepository  {
  CreateMarketRemoteDataSource createMarketRemoteDataSource ;

  CreateMarketRepository({
    required this.createMarketRemoteDataSource,
  });

  Future<Either<Failure,dynamic>>createMarket({required MarketBodyModel createMarketBodyModel})async{
    try{
      final response =await createMarketRemoteDataSource.createMarket(createMarketBodyModel: createMarketBodyModel);
      print(response);
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
