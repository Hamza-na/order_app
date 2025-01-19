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

  String ?addrees; 



  eitherFailureOrUpdateProfile(UpdateProfileBodyModel user) async{
    emit(UpdateProfileLoading());
    final result = await sl<UpdateProfileRepository>().updateProfile(user);

      result.fold((failure) {
        emit(UpdateProfileFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage));
      }, (updateProfileResponseModel) {
        emit(UpdateProfileSuccessfully(updateProfileResponseModel));
        eitherFailureOrGetMe();
      });
  }
  eitherFailureOrGetMe() {
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      emit(MeLoading());
    final result = await sl<MeRepository>().me();

      result.fold((failure) {
        emit(MeFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage));
      }, (user) {
        addrees = user.location;
        emit(MeSuccessfully(user));
      });
    });
    
  }
}
