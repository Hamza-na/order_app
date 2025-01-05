
import 'package:order_app/core/entities/auth_response_entitiy.dart';

class LoginState {}

final class LoginInitial extends LoginState {}


final class LoginLoading extends LoginState{}

final class LoginFailure extends LoginState{
  final String errMessage;

  LoginFailure({required this.errMessage});
}
final class LoginSuccessfully extends LoginState{
  final AuthResponseEntitiy loginResponseEntitiy;

  LoginSuccessfully({required this.loginResponseEntitiy});
}

