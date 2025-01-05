import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) {
        return current is SignUpLoading ||
            current is SignUpSuccessfully ||
            current is SignUpFailure;
      },
      listener: (context, state) {
        if (state is SignUpFailure) {
          setupErrorState(context, state.errMessage);
        } else if (state is SignUpSuccessfully) {
          context.pop();
          signUpSuccessfully(context);
        } else if (state is SignUpLoading) {
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
   
    showSuccessDialog(context);
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
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
                context.pushNamed(Routes.loginScreen);
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
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
