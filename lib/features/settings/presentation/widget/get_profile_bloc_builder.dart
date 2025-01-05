import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/features/settings/presentation/widget/profile_body.dart';

class GetProfileBlocBuilder extends StatelessWidget {
  const GetProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is MeSuccessfully || current is MeFailure || current is MeLoading,
      builder: (context, state) {
        if(state is MeSuccessfully){
          return ProfileBody(user: state.userModel,);
        }
        else if(state is MeFailure){
          const Text("error");
        }
        else if(state is MeLoading){
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
        return const  SizedBox.shrink();
      },
    );
  }
  
}