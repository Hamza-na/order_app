import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/localization/cubit/local_cubit.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';

class RemoveOrderBlocListener extends StatelessWidget {
  const RemoveOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersCubit, OrdersState>(
      listenWhen: (previous, current) {
        return current is RemoveOrdersFailure ||
            current is RemoveOrdersLoading ||
            current is RemoveOrdersSuccessfully;
      },
      listener: (context, state) {
        if (state is RemoveOrdersFailure) {
          final currentLocale = context.read<LocaleCubit>().state.locale;
          setupErrorState(context,currentLocale.languageCode =='ar'?state.arErrMessage:state.errMessage);
        } else if (state is RemoveOrdersSuccessfully) {
          context.pop();
          removeOrderSuccessfully(context);
        } else if (state is RemoveOrdersLoading) {
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

  void removeOrderSuccessfully(BuildContext context) {
    context.pushNamed(Routes.entryPoint);
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
