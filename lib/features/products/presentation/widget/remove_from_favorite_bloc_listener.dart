import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';

class RemoveFromFavoriteBlocListener extends StatelessWidget {
  RemoveFromFavoriteBlocListener({super.key,required this.productId});

  int productId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetProductsCubit, GetProductsState>(
      listenWhen: (previous, current) =>
          current is RemoveFromFavoriteFailure || current is RemoveFromFavoriteSuccessfully ,
      listener: (context, state) {
        if(state is RemoveFromFavoriteSuccessfully){
          //context.read<GetProductsCubit>().favorites.remove(productId);
          }
        else if(state is RemoveFromFavoriteSuccessfully){
          // ! Todo 
        }
      },
    );
  }
  
}