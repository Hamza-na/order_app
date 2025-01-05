import 'package:order_app/core/models/products_model.dart';

class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState{}

final class GetProductsFailure extends GetProductsState{
  final String errMessage;

  GetProductsFailure({required this.errMessage});
}
final class GetProductsSuccessfully extends GetProductsState{
  final ProductsModel productsModel;

  GetProductsSuccessfully({required this.productsModel});
}
final class AddToFavoriteFailure extends GetProductsState{
  final String errMessage;

  AddToFavoriteFailure({required this.errMessage});
}
final class AddToFavoriteSuccessfully extends GetProductsState{
  // final String message;
  // AddToFavoriteSuccessfully({required this.message});
}
final class RemoveFromFavoriteFailure extends GetProductsState{
  final String errMessage;

  RemoveFromFavoriteFailure({required this.errMessage});
}
final class RemoveFromFavoriteSuccessfully extends GetProductsState{
  final String message;
  RemoveFromFavoriteSuccessfully({required this.message});
}

