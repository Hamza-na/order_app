import 'package:order_app/features/details_of_product/data/models/add_to_cart_response.dart';
class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}


final class AddToCartLoading extends AddToCartState{}

final class AddToCartFailure extends AddToCartState{
  final String errMessage;

  AddToCartFailure({required this.errMessage});
}
final class AddToCartSuccessfully extends AddToCartState{
  final AddToCartResponse addToCartResponse;

  AddToCartSuccessfully({required this.addToCartResponse});
}

