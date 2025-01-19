part of 'favorite_products_cubit.dart';


class FavoriteProductsState {}

final class FavoriteInitial extends FavoriteProductsState {}
final class FavoriteLoading extends FavoriteProductsState {}
final class FavoriteSuccessfuly extends FavoriteProductsState {
  FavoriteProductsModel ?favoriteProductsModel;
  FavoriteSuccessfuly({required this.favoriteProductsModel});
}
final class FavoriteFailure extends FavoriteProductsState {
 final String errMessage;
  final String arErrMessage;

  FavoriteFailure({required this.errMessage, required this.arErrMessage});
}
