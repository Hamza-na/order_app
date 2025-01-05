import 'package:dartz/dartz.dart';
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

  Future<Either<Failure,MarketReponseModel>>createMarket({required MarketBodyModel createMarketBodyModel})async{
    try{
      final response =await createMarketRemoteDataSource.createMarket(createMarketBodyModel: createMarketBodyModel);
      return Right(response);
    }on ServerException catch(e){
      return Left(Failure(errMessage:e.errorModel.errorMessage));
    }
  }
}
