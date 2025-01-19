import 'package:order_app/core/models/products_model.dart';

class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState{}

final class GetProductsFailure extends GetProductsState{
  final String errMessage;
  final String arErrMessage;

  GetProductsFailure({required this.errMessage, required this.arErrMessage});
}
final class GetProductsSuccessfully extends GetProductsState{
  final ProductsModel productsModel;

  GetProductsSuccessfully({required this.productsModel});
}
final class AddToFavoriteFailure extends GetProductsState{
  final String errMessage;
  final String arErrMessage;

  AddToFavoriteFailure({required this.errMessage, required this.arErrMessage});
}
final class AddToFavoriteSuccessfully extends GetProductsState{
  // final String message;
  // AddToFavoriteSuccessfully({required this.message});
}
final class RemoveFromFavoriteFailure extends GetProductsState{
 final String errMessage;
  final String arErrMessage;

  RemoveFromFavoriteFailure({required this.errMessage, required this.arErrMessage});
}
final class RemoveFromFavoriteSuccessfully extends GetProductsState{
 // final String message;
  RemoveFromFavoriteSuccessfully(
    //required this.message
    );
}

