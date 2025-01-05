
import 'package:order_app/core/models/cart_model.dart';

class CartState {}

final class CartInitial extends CartState {}

// add to cart
final class CartLoading extends CartState {}
final class CartFailure extends CartState {
  String errMessage ;

  CartFailure({required this.errMessage});

}
final class CartSuccessfuly extends CartState {

  CartModel cartModel;
  CartSuccessfuly({required this.cartModel});
}

// remove form cart

final class RemoveFromCartFailure extends CartState {
  String errMessage ;

  RemoveFromCartFailure({required this.errMessage});
}
final class RemoveFromCartSuccessfuly extends CartState {
  String message ;
  RemoveFromCartSuccessfuly({required this.message});
  }








