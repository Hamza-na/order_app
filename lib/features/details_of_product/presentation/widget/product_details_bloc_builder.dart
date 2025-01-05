import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_state.dart';
import 'package:order_app/features/details_of_product/presentation/screens/product_details.dart';
import 'package:order_app/features/details_of_product/presentation/widget/product_details_loading.dart';

class ProductDetailsBlocBuilder extends StatelessWidget {
  const ProductDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
      buildWhen: (previous, current) =>
          current is GetProductDetailsSuccessfully || current is GetProductDetailsFailure || current is GetProductDetailsLoading,
      builder: (context, state) {
        if(state is GetProductDetailsSuccessfully){
          return ProductDetails(productDetails: state.getProductDetailsModel);
        }
        else if(state is GetProductDetailsFailure){
          return const Text("error");
        }
        else if(state is GetProductDetailsLoading){
          return const  ProductDetailsLoading();
        }
        return const SizedBox.shrink();
      },
    );
  }
  
}