import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/products/data/repositories/add_to_favorite_repository.dart';
import 'package:order_app/features/products/data/repositories/get_products_markets_repository.dart';
import 'package:order_app/features/products/data/repositories/remove_from_favorite_repository.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
Set<int> favoriteProductIds = {};

  
  GetProductsCubit(this.favoriteProductsCubit) : super(GetProductsInitial());
  final FavoriteProductsCubit favoriteProductsCubit ;
   


   eitherFailureOrGetProducts (int productParams)async{
    emit(GetProductsLoading());

    final failureOrGetProducts = await sl<GetProductsMarketsRepository>().getProducts(getProductsParams: productParams);


    failureOrGetProducts.fold(
      (failure) => emit(GetProductsFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (products) => emit(GetProductsSuccessfully(productsModel: products)),
    );
  }
  eitherFailureOrAddToFavorite(int productId)async{
   favoriteProductIds.add(productId); // Optimistically add to favorites
    //emit(GetProductsSuccessfully(favoriteIds: favoriteProductIds));
    final failureOrAddToFavorite = await sl<AddToFavoriteRepository>().addToFavorite(productId: productId);

    failureOrAddToFavorite.fold(
      (failure) => emit(AddToFavoriteFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) {
        print("successs");

    emit(AddToFavoriteSuccessfully());
      }
    );
  }
  eitherFailureOrRemoveFromFavorite (int productId)async{

    favoriteProductIds.remove(productId); // Optimistically remove from favorites
    //emit(GetProductsSuccessfully(favoriteIds: favoriteProductIds));
    final failureOrGetProducts = await sl<RemoveFromFavoriteRepository>().removeFromfavorite(productId: productId);

    failureOrGetProducts.fold(
      (failure) => emit(RemoveFromFavoriteFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) {
      emit(RemoveFromFavoriteSuccessfully());

      }
    );
  }

    Future<void> loadFavoriteIds() async {
    final favoriteCubit = sl<FavoriteProductsCubit>();

    if (favoriteCubit.state is! FavoriteSuccessfuly) {
      await favoriteCubit.eitherFailureOrGetFavorite();
    }

    if (favoriteCubit.state is FavoriteSuccessfuly) {
      final favoriteProductsModel =
          (favoriteCubit.state as FavoriteSuccessfuly).favoriteProductsModel;

      if (favoriteProductsModel != null) {
        favoriteProductIds = favoriteProductsModel.favoriateProductsModel!
            .map((product) => product.productModelOfResturant.id)
            .toSet();
            emit(GetProductsSuccessfully(productsModel: (state as GetProductsSuccessfully).productsModel));
      }
       
    }
  }

  bool isFavorite(int productId) {
    return favoriteProductIds.contains(productId);
  }


}
