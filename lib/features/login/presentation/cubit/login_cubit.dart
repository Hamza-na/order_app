import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/databases/cache/cache_helper.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/models/auth_body_model.dart';
import 'package:order_app/features/login/domain/usecases/login.dart';
import 'package:order_app/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitial());

    TextEditingController phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final formKeyAdmin = GlobalKey<FormState>();

   eitherFailureOrLogin ()async{
   emit(LoginLoading());
   print("LoginLoading emitted");

final failureOrLogin = await sl<Login>().call(
  loginBodyModel: AuthBodyModel(phoneNumber: phoneController.text),
);

failureOrLogin.fold(
  (failure) {
  //  print("LoginFailure emitted: ${failure.errMessage}");
    emit(LoginFailure(errMessage: failure.errMessage));
  },
  (user)async {
    //print("LoginSuccessfully emitted");
    await saveUserToken(user.accessTokenEntitiy.token,user.refreshTokenEntitiy.token,user.accessTokenEntitiy.expiresIn);
    emit(LoginSuccessfully(loginResponseEntitiy: user));
  },
);

  }
   Future<void> saveUserToken(String accessToken ,String refreshToken,String expiresIn) async {
    await SharedPrefHelper.setData("accessToken", accessToken);
    await SharedPrefHelper.setData("refreshToken", refreshToken);
    DateTime afterExpiresIn = DateTime.parse(expiresIn);
    afterExpiresIn.add( const Duration(minutes: 59));
    await SharedPrefHelper.setData("expiresIn", afterExpiresIn.toString());
    
  }
}

