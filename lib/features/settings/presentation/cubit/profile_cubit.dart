import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/models/sub_models/user_model.dart';
import 'package:order_app/features/settings/data/models/update_profile_body_model.dart';
import 'package:order_app/features/settings/data/models/update_profile_response_model.dart';
import 'package:order_app/features/settings/data/repositories/me_repository.dart';
import 'package:order_app/features/settings/data/repositories/update_profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(UpdateProfileInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  XFile? image;

  eitherFailureOrUpdateProfile() async{
    emit(UpdateProfileLoading());
    final result = await sl<UpdateProfileRepository>().updateProfile(UpdateProfileBodyModel(
        method: 'put',
        name: nameController.text,
        location: locationController.text,
        image: File(image!.path),
      )
    );

      result.fold((failure) {
        emit(UpdateProfileFailure(failure.errMessage));
      }, (updateProfileResponseModel) {
        emit(UpdateProfileSuccessfully(updateProfileResponseModel));
      });
  }
  eitherFailureOrGetMe() async{
    emit(MeLoading());
    final result = await sl<MeRepository>().me();

      result.fold((failure) {
        emit(MeFailure(failure.errMessage));
      }, (user) {
        emit(MeSuccessfully(user));
      });
  }
}
