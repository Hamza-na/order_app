import 'package:dartz/dartz.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/auth_body_model.dart';
import 'package:order_app/features/login/domain/repositories/login_repository.dart';

class Login {
  final LoginRepository loginRepository;

  Login({ required this.loginRepository});


  Future<Either<Failure,AuthResponseEntitiy>>call({required AuthBodyModel loginBodyModel}){
    return  loginRepository.login(loginBodyModel: loginBodyModel);
  }


}