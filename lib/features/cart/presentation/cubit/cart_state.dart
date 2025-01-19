
import 'package:order_app/core/models/cart_model.dart';

class CartState {}

final class CartInitial extends CartState {}

// add to cart
final class CartLoading extends CartState {}
final class CartFailure extends CartState {
  final String errMessage;
  final String arErrMessage;

  CartFailure({required this.errMessage, required this.arErrMessage});

}
final class CartSuccessfuly extends CartState {

  CartModel cartModel;
  CartSuccessfuly({required this.cartModel});
}











