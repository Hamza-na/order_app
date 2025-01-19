import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/settings/presentation/widget/get_profile_bloc_builder.dart';
import 'package:order_app/generated/l10n.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppBar(context),
        body:const GetProfileBlocBuilder()
        );
  }

  AppBar settingAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title:  Text(S.of(context).profile),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Ionicons.chevron_back_outline,
          color: Colors.white,
        ),
      ),
      leadingWidth: 80,
    );
  }
}


