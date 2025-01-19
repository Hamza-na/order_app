
import 'package:order_app/features/logout/data/models/log_out_response_model.dart';

class LogOutState {}

final class LogOutInitial extends LogOutState {}


final class LogOutLoading extends LogOutState{}

final class LogOutFailure extends LogOutState{
  final String errMessage;
  final String arErrMessage;

  LogOutFailure({required this.errMessage, required this.arErrMessage});
}
final class LogOutSuccessfully extends LogOutState{
  final LogOutResponseModel logOutResponseModel;

  LogOutSuccessfully({required this.logOutResponseModel});
}

