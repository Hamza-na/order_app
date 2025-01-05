import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/settings/presentation/widget/profile_image.dart';
import 'package:order_app/features/settings/presentation/widget/setting_item.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key, required this.user});

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Center(
                child:  Column(
                  children: [
                    const ProfileImage(),
                    Text(user.name
                    ,style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    Text(user.phoneNumber,style: TextStyle(fontSize: 16,color: Colors.grey),)
                  ],
                )
                ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              SettingItem(
                title: "Edit Profile",
                icon: Icons.person,
                bgColor: secondColor.withAlpha(20),
                iconColor: secondColor,
                onTap: (){
                context.pushNamed(Routes.editProfileScreen);
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Language",
                icon: Ionicons.earth,
                bgColor: primaryColor.withAlpha(20),
                iconColor: primaryColor,
                value: 'selectedLanguage'.toUpperCase(),
                onTap: _showLanguageDialog(context),
              ),
            ],
          ),
        ),
      );
  }
}
dynamic _showLanguageDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                leading: Radio<String>(
                  activeColor: primaryColor,
                  value: 'en',
                  groupValue: 'selectedLanguage',
                  onChanged: (value) {
                    
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: const Text('Arabic'),
                leading: Radio<String>(
                  activeColor: primaryColor,
                  value: 'ar',
                  groupValue: 'selectedLanguage',
                  onChanged: (value) {
                    
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel',style: TextStyle(
                color: primaryColor
              ),),
            ),
          ],
        );
      },
    );
  }