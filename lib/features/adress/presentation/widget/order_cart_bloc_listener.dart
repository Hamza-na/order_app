import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_cubit.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_state.dart';

class OrderCartBlocListener extends StatelessWidget {
  const OrderCartBlocListener({super.key});
  //final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCartCubit, OrderCartState>(
      listenWhen: (previous, current) =>
          current is CartOrderSuccessfuly || current is CartOrderLoading || current is CartOrderFailure,
      listener: (context, state) {
        if(state is CartOrderSuccessfuly){
          showSuccessDialog(context) ;
        }
        else if(state is CartOrderFailure){
          setupErrorState(context,state.errMessage);
        }
        else if(state is CartOrderLoading){
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: primaryColor),
            ),
          ); 
        }
      },
      child: const SizedBox.shrink(),
    );
  }
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Cart Successfully'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have order cart successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
              ),
              
              onPressed: () {
                context.pushNamed(Routes.ordersScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

   void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            style:const  ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor)),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
  
}