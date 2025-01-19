import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/databases/cache/cache_helper.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/localization/cubit/local_cubit.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/login/presentation/screens/login_screen.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/features/settings/presentation/screens/edit_screen.dart';
import 'package:order_app/features/settings/presentation/widget/profile_image.dart';
import 'package:order_app/features/settings/presentation/widget/setting_item.dart';
import 'package:order_app/generated/l10n.dart';
import 'package:order_app/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:order_app/features/logout/presentation/cubit/log_out_state.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ProfileImage(image: user.image),
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    user.phoneNumber,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),
            SettingItem(
              title: S.of(context).edit_profile,
              icon: Icons.person,
              bgColor: secondColor.withAlpha(20),
              iconColor: secondColor,
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                              create: (context) => ProfileCubit(),
                              child: EditAccountScreen(user: user),
                            )));
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: S.of(context).language,
              icon: Ionicons.earth,
              bgColor: primaryColor.withAlpha(20),
              iconColor: primaryColor,
              value: user.lang,
              onTap: () => _showLanguageDialog(context),
            ),
            const SizedBox(height: 20),
            BlocConsumer<LogOutCubit, LogOutState>(
              listener: (context, state) async {
                if (state is LogOutSuccessfully) {
                  context.pushNamed(Routes.loginScreen);
                  await SharedPrefHelper.clearAllData();
                } else if (state is LogOutFailure) {
                  final currentLocale =
                      context.read<LocaleCubit>().state.locale;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        currentLocale.languageCode == 'ar'
                            ? state.arErrMessage
                            : state.errMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 3),
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LogOutLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SettingItem(
                  title: S.of(context).log_out,
                  icon: Icons.logout,
                  bgColor: Colors.red.withAlpha(20),
                  iconColor: Colors.red,
                  onTap: () {
                    context.read<LogOutCubit>().eitherFailureOrLogOut();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

dynamic _showLanguageDialog(BuildContext context) {
  final localeCubit = context.read<LocaleCubit>();
  final currentLanguage = localeCubit.state.locale.languageCode;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).select_Language),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English'),
              leading: Radio<String>(
                activeColor: primaryColor,
                value: 'en',
                groupValue: currentLanguage,
                onChanged: (value) {
                  localeCubit.changeLanguage(value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Arabic'),
              leading: Radio<String>(
                activeColor: primaryColor,
                value: 'ar',
                groupValue: currentLanguage,
                onChanged: (value) {
                  localeCubit.changeLanguage(value!);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).cancel,
              style: const TextStyle(color: primaryColor),
            ),
          ),
        ],
      );
    },
  );
}
