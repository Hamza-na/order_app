import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:order_app/features/sign_up/data/models/sign_up_body_model.dart';
import 'package:order_app/features/sign_up/domain/usecases/sign_up.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:order_app/core/di/dependency_injection.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneConfirmationController = TextEditingController();
  
  XFile? image;
  final formKey = GlobalKey<FormState>();

  
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      image = pickedFile;
      emit(ImageSuccessfully());
    } else {
      
    }
  }

  // Sign Up Method
  Future<void> eitherFailureOrSignUp() async {
    if (!formKey.currentState!.validate()) return;
    
    emit(SignUpLoading());

    final failureOrSignUp = await sl<SignUp>().call(
      signupBodyEntitiy: SignUpBodyModel(
        name: nameController.text,
        phoneNumber: phoneController.text,
        phoneNumberConfirmation: phoneConfirmationController.text,
        location: locationController.text,
        image: image != null ? File(image!.path) : null,
      ),
    );

    failureOrSignUp.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (user) => emit(SignUpSuccessfully(signUpResponseEntitiy: user)),
    );
  }
}
