// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:order_app/core/constant/colors/colors.dart';
// import 'package:order_app/features/cart/presentation/cubit/cart_cubit.dart';
// import 'package:order_app/features/cart/presentation/cubit/cart_state.dart';

// class CartBlocBuilder extends StatelessWidget {
//   const CartBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       buildWhen: (previous, current) =>
//           current is CartSuccessfuly || current is CartFailure || current is CartLoading,
//       builder: (context, state) {
//         if(state is CartSuccessfuly){
//           return CartScreen(cartModel: state.cartModel,);
//         }
//         else if(state is CartFailure){
//           return const Text("error");
//         }
//         else if(state is CartLoading){
//             showDialog(
//             context: context,
//             builder: (context) => const Center(
//               child: CircularProgressIndicator(color: primaryColor),
//             ),
//           );
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
  
// }