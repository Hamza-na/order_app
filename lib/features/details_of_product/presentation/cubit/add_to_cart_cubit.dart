
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/details_of_product/data/repositories/add_to_cart_repository.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {

  AddToCartCubit() : super(AddToCartInitial());

   eitherFailureOrAddToCart (int addToCartParams)async{
    emit(AddToCartLoading());

    final failureOrAddToCart = await sl<AddToCartRepository>().addToCart(addToCartParams:addToCartParams );

    failureOrAddToCart.fold(
      (failure) => emit(AddToCartFailure(errMessage: failure.errMessage)),
      (addToCart) => emit(AddToCartSuccessfully(addToCartResponse: addToCart)),
    );
  }
}
