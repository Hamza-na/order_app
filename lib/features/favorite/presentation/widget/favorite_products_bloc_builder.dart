import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/shops/presentation/widget/loading_market.dart';

class FavoriteProductsBlocBuilder extends StatelessWidget {
  const FavoriteProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
      buildWhen: (previous, current) =>
          current is FavoriteSuccessfuly || current is FavoriteFailure || current is FavoriteLoading,
      builder: (context, state) {
        if(state is FavoriteSuccessfuly){
         // return ResturantList(marketList: state.marketsModels.marketsItem,);
        }
        else if(state is FavoriteFailure){
          return const Text("error");
        }
        else if(state is FavoriteLoading){
          return const  SkeletonLoader();
        }
        return const SizedBox.shrink();
      },
    );
  }
  
}