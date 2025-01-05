import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/logout/data/models/log_out_body_model.dart';
import 'package:order_app/features/logout/data/repositories/log_out_repository_impl.dart';
import 'package:order_app/features/logout/presentation/cubit/log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {

  LogOutCubit() : super(LogOutInitial());

   eitherFailureOrLogOut (LogOutBodyModel logOutBodyModel)async{
    emit(LogOutLoading());

    final failureOrLogOut = await sl<LogOutRepositoryImpl>().logout(logOutBodyModel: logOutBodyModel);


    failureOrLogOut.fold(
      (failure) => emit(LogOutFailure(errMessage: failure.errMessage)),
      (logOut) => emit(LogOutSuccessfully(logOutResponseModel: logOut)),
    );
  }
}
