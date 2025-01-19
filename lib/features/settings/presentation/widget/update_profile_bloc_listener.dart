import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/localization/cubit/local_cubit.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is UpdateProfileSuccessfully || current is UpdateProfileFailure || current is UpdateProfileLoading,
      listener: (context, state) {
        if(state is UpdateProfileSuccessfully){
          
        }
        else if(state is UpdateProfileFailure){
          final currentLocale = context.read<LocaleCubit>().state.locale;
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        currentLocale.languageCode =='ar'?state.arErrMessage:state.errMessage, // Error message
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating, // Makes it float above content
      duration: const Duration(seconds: 3), // Automatically disappears
      margin: const EdgeInsets.only(
        bottom: 20.0, // Position it higher
        left: 16.0,
        right: 16.0,
      ),
    ),
  ); 
        }
        else if(state is UpdateProfileLoading){
         const Center(
           child:  CircularProgressIndicator(
              color: primaryColor,
              
             ),
         );
        }
        
      },
    );
  }
  
}