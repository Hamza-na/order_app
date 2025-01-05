import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/features/sign_up/data/models/sign_up_body_model.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/features/sign_up/domain/repositories/sign_up_repository.dart';

class SignUp {
  final SignUpRepository signUpRepository;

  SignUp({ required this.signUpRepository});


  Future<Either<Failure,AuthResponseEntitiy>>call({required SignUpBodyModel signupBodyEntitiy})async{
    return signUpRepository.signup(signUpBodyModel: signupBodyEntitiy);
  }


}