import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_to_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_to_cart_state.dart';

class AddToCartBlocListener extends StatelessWidget {
  const AddToCartBlocListener({super.key});
  //final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listenWhen: (previous, current) =>
          current is AddToCartSuccessfully || current is AddToCartFailure || current is AddToCartLoading,
      listener: (context, state) {
        if(state is AddToCartSuccessfully){
          showSuccessDialog(context) ;
        }
        else if(state is AddToCartFailure){
          setupErrorState(context,state.errMessage);
        }
        else if(state is AddToCartLoading){
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
          title: const Text('Add to cart successfully'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have Add product successfully!'),
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
               // context.pushNamed(Routes.loginScreen);
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