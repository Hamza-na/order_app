import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/favorite/data/models/favorite_products_model.dart';
import 'package:order_app/features/favorite/data/repositories/favorite_products_repository.dart';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteInitial());

  eitherFailureOrGetFavorite() async {
    emit(FavoriteLoading());
    final response = await sl<FavoriteProductsRepository>().getFavoriteProducts();
    response.fold(
      (failure) => emit(FavoriteFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (favoriteProductsModel) => emit(FavoriteSuccessfuly(favoriteProductsModel: favoriteProductsModel)),
    );
  }


}
