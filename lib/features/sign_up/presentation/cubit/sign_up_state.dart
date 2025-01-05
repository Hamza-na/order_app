
import 'package:order_app/core/entities/auth_response_entitiy.dart';

class SignUpState {}

final class SignUpInitial extends SignUpState {}


final class SignUpLoading extends SignUpState{}
final class ImageSuccessfully extends SignUpState{}

final class SignUpFailure extends SignUpState{
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
final class SignUpSuccessfully extends SignUpState{
  final AuthResponseEntitiy signUpResponseEntitiy;

  SignUpSuccessfully({required this.signUpResponseEntitiy});
}

