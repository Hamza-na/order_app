
import 'package:order_app/features/shops/data/models/markets_models.dart';

class MarketsState {}

final class MarketsInitial extends MarketsState {}
final class MarketsLoading extends MarketsState {}
final class MarketsFailure extends MarketsState {
  String errMessage ;

  MarketsFailure({required this.errMessage});

}
final class MarketsSuccessfuly extends MarketsState {

  MarketsModels marketsModels;
  MarketsSuccessfuly({required this.marketsModels});
}

final class SearchMarketsLoading extends MarketsState {}
final class SearchMarketsFailure extends MarketsState {
  String errMessage ;

  SearchMarketsFailure({required this.errMessage});

}
final class SearchMarketsSuccessfuly extends MarketsState {

  MarketsModels marketsModels;
  SearchMarketsSuccessfuly({required this.marketsModels});
}

