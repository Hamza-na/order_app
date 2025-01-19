import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/cart/data/repositories/get_cart_repository.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  eitherFailureOrGetCart() async {
    emit(CartLoading());

    final failureOrGetCart = await sl<GetCartRepository>().getCart();

    failureOrGetCart.fold(
        (failure) => emit(CartFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
        (cart) => emit(CartSuccessfuly(cartModel: cart)));
  }
  

}
