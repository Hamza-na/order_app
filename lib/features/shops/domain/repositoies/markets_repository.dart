import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/shops/data/models/markets_models.dart';


abstract class MarketsRepository {

  Future<Either<Failure,MarketsModels>>getMarkets();

}