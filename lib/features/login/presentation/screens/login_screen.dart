import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/core/widgets/page_title_bar.dart';
import 'package:order_app/core/widgets/rounded_input_field.dart';
import 'package:order_app/core/widgets/under_part.dart';
import 'package:order_app/core/widgets/upside.dart';
import 'package:order_app/core/widgets/rounded_button.dart';
import 'package:order_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:order_app/features/login/presentation/widget/login_bloc_listener.dart';
import 'package:order_app/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/login.svg",
                ),
                 PageTitleBar(title: S.of(context).title_login_screen),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: context.read<LoginCubit>().formKey,
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: S.of(context).phone,
                                icon: Icons.phone,
                                validator: (value) {
                                  if (value!.length != 10) {
                                    return S.of(context).phone_condition_count_number;
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return S.of(context).phone_condition_number;
                                  }
                                },
                                controller:
                                    context.read<LoginCubit>().phoneController,
                              ),


                              RoundedButton(text: S.of(context).login, press: () {
                                validateThenDoLogin(context);
                              }),
                              const SizedBox(
                                height: 10,
                              ),


                              UnderPart(
                                title: S.of(context).dont_have_account,
                                navigatorText: "Register here",
                                onTap: () {
                                  context.pushNamed(Routes.signUpScreen);
                                },
                              ),


                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              LoginBlocListener(routeName: Routes.entryPoint,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().eitherFailureOrLogin();
    }
  }
}
