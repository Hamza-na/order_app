import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/admin/presentation/widgets/shop_table.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_state.dart';
import 'package:order_app/features/shops/presentation/widget/loading_market.dart';
import 'package:order_app/features/shops/presentation/widget/resturant_list.dart';

class MarketBlocBuilder extends StatelessWidget {
  MarketBlocBuilder({super.key,required this.isAdmin});
  bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          current is MarketsSuccessfuly || current is MarketsFailure || current is MarketsLoading||
          current is SearchMarketsSuccessfuly || current is SearchMarketsFailure || current is SearchMarketsLoading,
      builder: (context, state) {
         if(state is SearchMarketsSuccessfuly){
          print("sucessssssssssssssssssssssssssssssssssssssssss!!!!!!!!!!!!!!!!!!!");
          return ResturantList(searchMarketList: state.marketsModels.marketsItem,);
        }
        else if(state is SearchMarketsFailure){
          return const Text("error");
        }
        else if(state is SearchMarketsLoading){
          return const  Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          )  ;
        }
        else if(state is MarketsSuccessfuly ){
          print("sucessssssssssssssssssssssssssssssssssssssssss");
          return isAdmin ? ShopTable(marketList: state.marketsModels.marketsItem,):ResturantList(marketList: state.marketsModels.marketsItem,);
        }
        else if(state is MarketsFailure){
          return const Text("error");
        }
        else if(state is MarketsLoading){
          return  isAdmin?const  Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          )  :const  SkeletonLoader();
        }
        
        return const SizedBox.shrink();
      },
    );
  }
  
}