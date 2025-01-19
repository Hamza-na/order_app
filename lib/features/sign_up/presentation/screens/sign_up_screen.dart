import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/core/widgets/page_title_bar.dart';
import 'package:order_app/core/widgets/under_part.dart';
import 'package:order_app/core/widgets/upside.dart';
import 'package:order_app/core/widgets/rounded_button.dart';
import 'package:order_app/core/widgets/rounded_input_field.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:order_app/features/sign_up/presentation/widget/sign_up_bloc_listener.dart';
import 'package:order_app/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                PageTitleBar(title: S.of(context).create_new_account),
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
                        const SizedBox(height: 20),
                        Form(
                          key: context.read<SignUpCubit>().formKey,
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
                                    context.read<SignUpCubit>().phoneController,
                              ),
                              RoundedInputField(
                                hintText: S.of(context).phone_confiramtion,
                                icon: Icons.phone,
                                validator: (value) {
                                  if (value !=
                                      context
                                          .read<SignUpCubit>()
                                          .phoneController
                                          .text) {
                                    return S.of(context).phone_confirmation_condition;
                                  }
                                },
                                controller: context
                                    .read<SignUpCubit>()
                                    .phoneConfirmationController,
                              ),
                              RoundedInputField(
                                hintText: S.of(context).name,
                                icon: Icons.person,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).name_condition;
                                  }
                                  if (value.length < 3 || value.length > 20) {
                                    return S.of(context).name_condition;
                                  }
                                },
                                controller:
                                    context.read<SignUpCubit>().nameController,
                              ),
                              RoundedInputField(
                                hintText: S.of(context).loacation,
                                icon: Icons.location_on,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  
                                  if (value.length < 3 || value.length > 200) {
                                    return S.of(context).loacation_condition;
                                  }
                                },
                                controller: context
                                    .read<SignUpCubit>()
                                    .locationController,
                              ),
                              SizedBox(
                                width: size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      S.of(context).upload_your_image,
                                      style:const  TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 17,
                                          color: Color(0xfff575861)),
                                    ),
                                    GestureDetector(
                                      onTap: () => context
                                          .read<SignUpCubit>()
                                          .pickImage(ImageSource.gallery),
                                      child: BlocBuilder<SignUpCubit,
                                          SignUpState>(
                                        builder: (context, state) {
                                          return CircleAvatar(
                                            radius: 40,
                                            backgroundImage: context
                                                        .read<SignUpCubit>()
                                                        .image !=
                                                    null
                                                ? FileImage(File(context
                                                    .read<SignUpCubit>()
                                                    .image!
                                                    .path))
                                                : null,
                                            child: context
                                                        .read<SignUpCubit>()
                                                        .image ==
                                                    null
                                                ? const Icon(Icons.camera_alt,
                                                    size: 20,
                                                    color: primaryColor)
                                                : null,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RoundedButton(
                                text: S.of(context).regisger,
                                press: () {
                                  validateThenDoSignup(context);
                                },
                              ),
                              const SizedBox(height: 10),
                              UnderPart(
                                title: S.of(context).already_have_account,
                                navigatorText: S.of(context).login_here,
                                onTap: () {
                                  context.pushNamed(Routes.loginScreen);
                                },
                              ),
                              const SizedBox(height: 20),
                              const SignupBlocListener(),
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

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().eitherFailureOrSignUp();
    } else {}
  }
}
