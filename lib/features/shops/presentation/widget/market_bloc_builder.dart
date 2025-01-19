import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/admin/presentation/screens/shop_screen_admin.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_state.dart';
import 'package:order_app/features/shops/presentation/widget/loading_market.dart';
import 'package:order_app/features/shops/presentation/widget/resturant_list.dart';

class MarketBlocBuilder extends StatelessWidget {
  final bool isAdmin;
  final Function(int) ?onShopSelected;

  MarketBlocBuilder({Key? key, required this.isAdmin,  this.onShopSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          current is MarketsSuccessfuly ||
          current is MarketsFailure ||
          current is MarketsLoading ||
          current is SearchMarketsSuccessfuly ||
          current is SearchMarketsFailure ||
          current is SearchMarketsLoading,
      builder: (context, state) {
        if (state is SearchMarketsSuccessfuly) {
          return ResturantList(marketList: state.marketsModels.marketsItem);
        } else if (state is SearchMarketsFailure) {
          return const Center(child: Text("Search Error"));
        } else if (state is SearchMarketsLoading) {
          return const SkeletonLoader();
        } else if (state is MarketsSuccessfuly) {
          return isAdmin
              ? ShopScreenAdmin(
                  marketList: state.marketsModels.marketsItem,
                  onViewShop: onShopSelected!,
                )
              : ResturantList(marketList: state.marketsModels.marketsItem);
        } else if (state is MarketsFailure) {
          return const Center(child: Text("Error loading markets"));
        } else if (state is MarketsLoading) {
          return isAdmin
              ? const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : const SkeletonLoader();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
