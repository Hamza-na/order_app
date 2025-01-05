import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:order_app/features/login/presentation/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
    
    LoginBlocListener({
    super.key,
    required this.routeName
    });

    final String routeName;

   

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is LoginLoading ||
            current is LoginSuccessfully ||
            current is LoginFailure;
      },
      listener: (context, state) {
        if (state is LoginFailure) {
          setupErrorState(context, state.errMessage);
        } else if (state is LoginSuccessfully) {
          context.pop();
          signUpSuccessfully(context);
        } else if (state is LoginLoading) {
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

  void signUpSuccessfully(BuildContext context) {
    context.pushNamed(routeName);
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
