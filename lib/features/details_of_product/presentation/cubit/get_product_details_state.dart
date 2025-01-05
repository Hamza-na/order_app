

import 'package:order_app/features/details_of_product/data/models/get_product_details_model.dart';

class GetProductDetailsState {}

final class GetProductDetailsInitial extends GetProductDetailsState {}


final class GetProductDetailsLoading extends GetProductDetailsState{}

final class GetProductDetailsFailure extends GetProductDetailsState{
  final String errMessage;

  GetProductDetailsFailure({required this.errMessage});
}
final class GetProductDetailsSuccessfully extends GetProductDetailsState{
  final GetProductDetailsModel getProductDetailsModel;

  GetProductDetailsSuccessfully({required this.getProductDetailsModel});
}

