import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';
import 'package:order_app/core/widgets/rounded_button.dart';
import 'package:order_app/core/widgets/rounded_input_field.dart';
import 'package:order_app/features/settings/data/models/update_profile_body_model.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/features/settings/presentation/widget/profile_image.dart';
import 'package:order_app/features/settings/presentation/widget/update_profile_bloc_listener.dart';
import 'package:order_app/generated/l10n.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  late TextEditingController nameController;
  late TextEditingController locationController;
  late String initialName;
  late String ?initialLocation;
  late String? initialImage;
  XFile? updatedImage;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    locationController = TextEditingController(text: widget.user.location);
    initialName = widget.user.name;
    initialLocation = widget.user.location;
    initialImage = widget.user.image;
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  bool hasChanges() {
    return nameController.text != initialName ||
        locationController.text != initialLocation ||
        updatedImage != null;
  }

 void updateProfile(BuildContext context) async {
  if (!hasChanges()) {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(S.of(context).no_change)),
    );
    return;
  }

  final profileCubit = context.read<ProfileCubit>();
  final newImage = updatedImage != null ? File(updatedImage!.path) : null;

  // Ensure you are sending the correct image file (either new or the original)

  profileCubit.eitherFailureOrUpdateProfile(
    UpdateProfileBodyModel(
      method: 'put',
      name: nameController.text,
      location: locationController.text,
      image: newImage,  
    ),
  );

 const  UpdateProfileBlocListener();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        centerTitle: true,
        title:  Text(
          S.of(context).edit_profile,
          style:const  TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ProfileImage(image: updatedImage?.path ?? initialImage),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              updatedImage = pickedImage;
                            });
                          }
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100), color: primaryColor),
                          child: const Icon(Icons.edit, color: Colors.black, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
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
                  controller: nameController,
                ),
                RoundedInputField(
                  hintText: S.of(context).loacation,
                  icon: Icons.location_on,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).loacation_condition;
                    }
                    if (value.length < 3 || value.length > 200) {
                      return  S.of(context).loacation_condition;
                    }
                  },
                  controller: locationController,
                ),
                RoundedButton(
                  text:  S.of(context).update,
                  press: () => updateProfile(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
