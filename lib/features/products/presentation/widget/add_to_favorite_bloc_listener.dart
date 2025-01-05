import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';

class AddToFavoriteBlocListener extends StatelessWidget {
  AddToFavoriteBlocListener({super.key,required this.productId});

  int productId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetProductsCubit, GetProductsState>(
      listenWhen: (previous, current) =>
          current is AddToFavoriteFailure || current is AddToFavoriteSuccessfully ,
      listener: (context, state) {
        if(state is AddToFavoriteSuccessfully){
          //context.read<GetProductsCubit>().favorites.add(productId);
          }
        else if(state is AddToFavoriteFailure){
          //! Todo
        }
      },
    );
  }
  
}