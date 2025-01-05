import 'package:dartz/dartz.dart';
import 'package:order_app/core/entities/auth_response_entitiy.dart';
import 'package:order_app/core/errors/failure.dart';
import 'package:order_app/core/models/auth_body_model.dart';

abstract class LoginRepository {

  Future<Either<Failure,AuthResponseEntitiy>> login({required AuthBodyModel loginBodyModel});

}