import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/localization/cubit/local_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_state.dart';

class AddToCartBlocListener extends StatelessWidget {
  const AddToCartBlocListener({super.key});
  //final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAndRemoveFromCartCubit, AddAndRemoveFromCartState>(
      listenWhen: (previous, current) =>
          current is RemoveFromCartFailure || current is AddToCartFailure ,
      listener: (context, state) {
         if(state is AddToCartFailure){
          final currentLocale = context.read<LocaleCubit>().state.locale;
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        currentLocale.languageCode =='ar'?state.arErrMessage:state.errMessage, // Error message
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating, // Makes it float above content
      duration: const Duration(seconds: 3), // Automatically disappears
      margin: const EdgeInsets.only(
        bottom: 20.0, // Position it higher
        left: 16.0,
        right: 16.0,
      ),
    ),
  ); 
        }
        else  if(state is RemoveFromCartFailure){
          final currentLocale = context.read<LocaleCubit>().state.locale;
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        currentLocale.languageCode =='ar'?state.arErrMessage:state.errMessage, // Error message
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating, // Makes it float above content
      duration: const Duration(seconds: 3), // Automatically disappears
      margin: const EdgeInsets.only(
        bottom: 20.0, // Position it higher
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