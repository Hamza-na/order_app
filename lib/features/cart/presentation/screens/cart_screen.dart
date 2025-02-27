import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:order_app/features/cart/presentation/widget/cart_body.dart';
import 'package:order_app/features/cart/presentation/widget/cart_bottom_sheet.dart';
import 'package:order_app/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title:  Text(S.of(context).cart),
        backgroundColor: primaryColor,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartSuccessfuly) {
            return CartBody(cartModel: state.cartModel,);
          } else if (state is CartFailure) {
            return const Center(child: Text("error"));
          }
          return const SizedBox.shrink();
        },
      ),
      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccessfuly) {
            return CartBottomSheet(cartModel: state.cartModel);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
