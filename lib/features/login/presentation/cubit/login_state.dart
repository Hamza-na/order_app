
import 'package:order_app/core/entities/auth_response_entitiy.dart';

class LoginState {}

final class LoginInitial extends LoginState {}


final class LoginLoading extends LoginState{}

final class LoginFailure extends LoginState{
  final String errMessage;
  final String arErrMessage;

  LoginFailure({required this.errMessage, required this.arErrMessage});
}
final class LoginSuccessfully extends LoginState{
  final AuthResponseEntitiy loginResponseEntitiy;

  LoginSuccessfully({required this.loginResponseEntitiy});
}

