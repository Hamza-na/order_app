import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/products/data/repositories/add_to_favorite_repository.dart';
import 'package:order_app/features/products/data/repositories/get_products_markets_repository.dart';
import 'package:order_app/features/products/data/repositories/remove_from_favorite_repository.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {

  GetProductsCubit() : super(GetProductsInitial());


   eitherFailureOrGetProducts (int productParams)async{
    emit(GetProductsLoading());

    final failureOrGetProducts = await sl<GetProductsMarketsRepository>().getProducts(getProductsParams: productParams);


    failureOrGetProducts.fold(
      (failure) => emit(GetProductsFailure(errMessage: failure.errMessage)),
      (products) => emit(GetProductsSuccessfully(productsModel: products)),
    );
  }
  eitherFailureOrAddToFavorite(int productId)async{

    final failureOrAddToFavorite = await sl<AddToFavoriteRepository>().addToFavorite(productId: productId);

    failureOrAddToFavorite.fold(
      (failure) => emit(AddToFavoriteFailure(errMessage: failure.errMessage)),
      (message) {
        print("successs");
 emit(AddToFavoriteSuccessfully());
      }
    );
  }
  eitherFailureOrRemoveFromFavorite (int productId)async{

    final failureOrGetProducts = await sl<RemoveFromFavoriteRepository>().removeFromfavorite(productId: productId);

    failureOrGetProducts.fold(
      (failure) => emit(RemoveFromFavoriteFailure(errMessage: failure.errMessage)),
      (message) => emit(RemoveFromFavoriteSuccessfully(message: message)),
    );
  }
}
