import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/widgets/rounded_button.dart';
import 'package:order_app/core/widgets/rounded_input_field.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/features/settings/presentation/widget/profile_image.dart';


class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {


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
        title: const Text("Edit Profile",style: TextStyle(
          fontWeight: FontWeight.bold,
          
        ),),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const  EdgeInsets.all(30),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const ProfileImage(),
                    Positioned(
                      right: 0,
                      bottom: 0,
                              child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: primaryColor),
                              child:const  Icon(Icons.edit,color: Colors.black,size: 20,),
                            )
                        )
                  ],
                ),
                const SizedBox(height: 40,),
                RoundedInputField(
                                  hintText: "Name :",
                                  icon: Icons.person,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "name must me between 3 and 20 char";
                                    }
                                    if (value.length < 3 || value.length > 20) {
                                      return "name must me between 3 and 20 char";
                                    }
                                  },
                                  controller:
                                      context.read<ProfileCubit>().nameController,
                                ),
                                RoundedInputField(
                                  hintText: "Location :",
                                  icon: Icons.location_on,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field must be between 3 and 200 characters";
                                    }
            
                                    if (value.length < 3 || value.length > 200) {
                                      return "Field must be between 3 and 200 characters";
                                    }
                                  },
                                  controller: context
                                      .read<ProfileCubit>()
                                      .locationController,
                                ),
                                RoundedButton(
                                text: 'Update',
                                press: () {

                                },
                              ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}