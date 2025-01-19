import 'package:order_app/features/details_of_product/data/models/add_and_remove_from_cart_response.dart';
class AddAndRemoveFromCartState {}

final class AddToCartInitial extends AddAndRemoveFromCartState {}

final class AddToCartFailure extends AddAndRemoveFromCartState{
  final String errMessage;
  final String arErrMessage;

  AddToCartFailure({required this.errMessage, required this.arErrMessage});
}
final class AddToCartSuccessfully extends AddAndRemoveFromCartState{
  final AddAndRemoveFromCartResponse addAndRemoveFromCartResponse;

  AddToCartSuccessfully({required this.addAndRemoveFromCartResponse});
}
final class RemoveFromCartFailure extends AddAndRemoveFromCartState {
  final String errMessage;
  final String arErrMessage;

  RemoveFromCartFailure({required this.errMessage, required this.arErrMessage});
}
final class RemoveFromCartSuccessfuly extends AddAndRemoveFromCartState {
  AddAndRemoveFromCartResponse addAndRemoveFromCartResponse ;
  RemoveFromCartSuccessfuly(
     this.addAndRemoveFromCartResponse
    );
  }

