

import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';

class GetProductDetailsState {}

final class GetProductDetailsInitial extends GetProductDetailsState {}


final class GetProductDetailsLoading extends GetProductDetailsState{}

final class GetProductDetailsFailure extends GetProductDetailsState{
  final String errMessage;

  GetProductDetailsFailure({required this.errMessage});
}
final class GetProductDetailsSuccessfully extends GetProductDetailsState{
  final ProductModelOfResturantWithImage getProductDetailsModel;

  GetProductDetailsSuccessfully({required this.getProductDetailsModel});
}

