import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/localization/cubit/local_cubit.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_cubit.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_state.dart';

class OrderCartBlocListener extends StatelessWidget {
  const OrderCartBlocListener({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCartCubit, OrderCartState>(
      listenWhen: (previous, current) =>
          current is CartOrderFailure ||
          current is OrdersUpdatingFailure ||
          current is AdreessFailure ||
          current is CartOrderSuccessfuly,
      listener: (context, state) {
         if(state is CartOrderFailure){
         final currentLocale = context.read<LocaleCubit>().state.locale;
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        currentLocale.languageCode =='ar'?state.arErrMessage:state.errMessage, // Error message
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating, 
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.only(
        bottom: 20.0, 
        left: 16.0,
        right: 16.0,
      ),
    ),
  ); 
        }
        else if(state is CartOrderSuccessfuly){
          context.pushNamed(Routes.order);
        }
        else if(state is OrdersUpdatingFailure){
        final currentLocale = context.read<LocaleCubit>().state.locale;
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        currentLocale.languageCode =='ar'?state.arErrMessage:state.errMessage,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating, 
      duration: const Duration(seconds: 3), 
      margin: const EdgeInsets.only(
        bottom: 20.0, 
        left: 16.0,
        right: 16.0,
      ),
    ),
  ); 
        }
        else if(state is AdreessFailure){
        final currentLocale = context.read<LocaleCubit>().state.locale;
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        currentLocale.languageCode =='ar'?"يجب تحديد مكان التوصيل":state.error,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating, 
      duration: const Duration(seconds: 3), 
      margin: const EdgeInsets.only(
        bottom: 20.0, 
        left: 16.0,
        right: 16.0,
      ),
    ),
  ); 
        }
      },
      child: const SizedBox.shrink(),
    );
  }
  
  
}