import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/cart/data/repositories/get_cart_repository.dart';
import 'package:order_app/features/cart/data/repositories/remove_product_from_cart_repository_repository.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  eitherFailureOrGetCart() async {
    emit(CartLoading());

    final failureOrGetCart = await sl<GetCartRepository>().getCart();

    failureOrGetCart.fold(
        (failure) => emit(CartFailure(errMessage: failure.errMessage)),
        (cart) => emit(CartSuccessfuly(cartModel: cart)));
  }
  eitherFailureOrRemoveFromCart({required int id}) async {

    final failureOrRemoveFromCart = await sl<RemoveProductFromCartRepositoryRepository>().removeProductFromCart(removeCartParams: id);

    failureOrRemoveFromCart.fold(
        (failure) => emit(RemoveFromCartFailure(errMessage: failure.errMessage)),
        (cart) => emit(RemoveFromCartSuccessfuly(message: cart)));
  }

}
