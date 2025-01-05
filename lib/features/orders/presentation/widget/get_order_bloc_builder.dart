import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';
import 'package:order_app/features/shops/presentation/widget/loading_market.dart';

class GetOrderBlocBuilder extends StatelessWidget {
  const GetOrderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (previous, current) =>
          current is OrdersSuccessfully || current is OrdersLoading || current is OrdersFailure,
      builder: (context, state) {
        if(state is OrdersSuccessfully){
         // return ResturantList(marketList: state.marketsModels.marketsItem,);
        }
        else if(state is OrdersFailure){
          return const Text("error");
        }
        else if(state is OrdersLoading){
          return const  SkeletonLoader();
        }
        return const SizedBox.shrink();
      },
    );
  }
  
}