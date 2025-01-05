import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/shops/data/models/markets_models.dart';
import 'package:order_app/features/shops/domain/repositoies/markets_repository.dart';

class GetMarkets  {

  MarketsRepository marketRepository;

  GetMarkets({
    required this.marketRepository,
  });

    Future<Either<Failure,MarketsModels>>call(){
      return marketRepository.getMarkets();
    }

}
