
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/details_of_product/data/repositories/get_product_details_repository.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {

  GetProductDetailsCubit() : super(GetProductDetailsInitial());

   eitherFailureOrGetProductDetails (int id)async{
    emit(GetProductDetailsLoading());

    final failureOrGetProductDetails = await sl<GetProductDetailsRepository>().getProductDetails(productParams: id);


    failureOrGetProductDetails.fold(
      (failure) => emit(GetProductDetailsFailure(errMessage: failure.errMessage)),
      (product) => emit(GetProductDetailsSuccessfully(getProductDetailsModel: product)),
    );
  }
}
