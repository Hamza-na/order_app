import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/admin/data/repositories/admin_response_repository.dart';
import 'package:order_app/features/orders/presentation/cubit/admin_response_state.dart';

class AdminResponseCubit extends Cubit<AdminResponseState> {
  AdminResponseCubit() : super(AdminResponseInitual());

  eitherFailureOrAdminResponse(int orderId, bool answer) async {
    final result = await sl<AdminResponseRepository>()
        .adminResponse(orderId: orderId, answer: answer);
    result.fold((failure) {
      emit(AdminResponseFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage));
    }, (message) {
      emit(AdminResponseSuccessfully(message));
    });
  }

}