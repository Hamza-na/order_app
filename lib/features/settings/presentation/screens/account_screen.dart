import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/features/settings/presentation/widget/get_profile_bloc_builder.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppBar(),
        body: const GetProfileBlocBuilder());
  }

  AppBar settingAppBar() {
    return AppBar(
      title: const Text("Profile"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Ionicons.chevron_back_outline,
          color: primaryColor,
        ),
      ),
      leadingWidth: 80,
    );
  }
}
