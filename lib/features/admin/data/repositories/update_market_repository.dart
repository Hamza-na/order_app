import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/sub_models/market_body_model.dart';
import 'package:order_app/features/admin/data/datasource/update_market_remote_data_source.dart';
import 'package:order_app/features/admin/data/models/update_market_response.dart';

class UpdateMarketRepository  {
  UpdateMarketRemoteDataSource updateMarketRemoteDataSource ;

  UpdateMarketRepository({
    required this.updateMarketRemoteDataSource,
  });

 
  Future<Either<Failure,UpdateMarketResponse>>updateMarket({required MarketBodyModel marketBodyModel,required int marketId})async{
    try{
      final response =await updateMarketRemoteDataSource.updateMarket(marketBodyModel: marketBodyModel,marketId:marketId );
      return Right(response);
    }on ServerException catch(e){
      return Left(Failure(errMessage:e.errorModel.errorMessage));
    }
  }
}
