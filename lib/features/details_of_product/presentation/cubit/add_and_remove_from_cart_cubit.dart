
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:order_app/features/details_of_product/data/repositories/add_to_cart_repository.dart';
import 'package:order_app/features/details_of_product/data/repositories/remove_product_from_cart_repository.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_state.dart';


class AddAndRemoveFromCartCubit extends Cubit<AddAndRemoveFromCartState> {

  final CartCubit cartCubit;

  AddAndRemoveFromCartCubit({required this.cartCubit}) : super(AddToCartInitial());

   eitherFailureOrAddToCart(int productId)async{

    final failureOrAddToCart = await sl<AddToCartRepository>().addToCart(addToCartParams:  productId);

    failureOrAddToCart.fold(
        (failure) => emit(AddToCartFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
        (response) => emit(AddToCartSuccessfully(addAndRemoveFromCartResponse: response)));
   }

  eitherFailureOrRemoveFromCart(int productId)async{

    final failureOrRemoveFromCart = await sl<RemoveProductFromCartRepository>().removeProductFromCart(removeCartParams: productId);

    failureOrRemoveFromCart.fold(
        (failure) {
          emit(RemoveFromCartFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage));
          print("emit failure");
        },
        (response) {
          emit(RemoveFromCartSuccessfuly(response));
          });
   }

}
