import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/shops/data/repositories/search_markets_repository.dart';
import 'package:order_app/features/shops/domain/usecases/get_markets.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_state.dart';

class MarketsCubit extends Cubit<MarketsState> {
  MarketsCubit() : super(MarketsInitial());
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  eitherFailureOrMarktes() async {
    emit(MarketsLoading());

    final failureOrMarktes = await sl<GetMarkets>().call();

    failureOrMarktes.fold(
        (failure) => emit(MarketsFailure(errMessage: failure.errMessage)),
        (markets) => emit(MarketsSuccessfuly(marketsModels: markets)));
  }
  eitherFailureOrSearchMarktes(String marketHint) async {
    emit(SearchMarketsLoading());
    print("loading");

    final failureOrSearchMarktes = await sl<SearchMarketsRepository>().searchMarkets(marketHint);

    failureOrSearchMarktes.fold(
        (failure) => emit(
          SearchMarketsFailure(errMessage: failure.errMessage),
        ),
        (markets) {
       print("Search success!");
      emit(SearchMarketsSuccessfuly(marketsModels: markets));
  });
  }
}
