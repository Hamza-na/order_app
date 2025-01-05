import 'package:flutter/material.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/admin/presentation/widgets/back_ground.dart';
import 'package:order_app/features/admin/presentation/widgets/login_form.dart';
import 'package:order_app/features/admin/presentation/widgets/login_screen_image_top.dart';
import 'package:order_app/features/admin/presentation/widgets/reponsive.dart';
import 'package:order_app/features/login/presentation/widget/login_bloc_listener.dart';

class LoginAdminScreen extends StatelessWidget {
  const LoginAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile:  const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
            const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm()
                    ),
                  ],
                ),
              ),
              LoginBlocListener(routeName: Routes.adminScreen),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}