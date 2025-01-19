import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';
import 'package:order_app/features/orders/presentation/screens/order.dart';

class GetOrderBlocBuilder extends StatelessWidget {
  const GetOrderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (previous, current) =>
          current is OrdersSuccessfully || current is OrdersLoading || current is OrdersFailure,
      builder: (context, state) {
        if(state is OrdersSuccessfully){
          return OrdersList(orders: state.ordersModel.ordersListModel,);
        }
        else if(state is OrdersFailure){
          return const Text("error");
        }
        else if(state is OrdersLoading){
          return const Center(child:  CircularProgressIndicator(color: primaryColor,),);
        }
        return const SizedBox.shrink();
      },
    );
  }
  
}