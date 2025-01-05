import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/widgets/rounded_button.dart';
import 'package:order_app/core/widgets/rounded_input_field.dart';
import 'package:order_app/features/login/presentation/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key:context.read<LoginCubit>().formKeyAdmin ,
      child: Column(
        children: [
          RoundedInputField(
            hintText: "Phone",
            icon: Icons.phone,
            validator: (value) {
              if (value!.length != 10) {
                return "phone must be 10 number";
              }
              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return "Input must contain only numbers";
              }
            },
            controller:
                context.read<LoginCubit>().phoneController,
          ),
          RoundedButton(text: 'LOGIN', press: () {
            validateThenDoLogin(context);
          }),
        ],
      ),
    );
  }
}
void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKeyAdmin.currentState!.validate()) {
      context.read<LoginCubit>().eitherFailureOrLogin();
    }
  }
