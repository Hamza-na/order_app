import 'package:dartz/dartz.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/features/sign_up/data/models/sign_up_body_model.dart';

abstract class SignUpRepository {

  Future<Either<Failure,AuthResponseEntitiy>> signup({required SignUpBodyModel signUpBodyModel});

}