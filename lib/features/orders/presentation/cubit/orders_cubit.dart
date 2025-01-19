import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/orders/data/repositoies/get_orders_repository.dart';
import 'package:order_app/features/orders/data/repositoies/order_confirmation_repository.dart';
import 'package:order_app/features/orders/data/repositoies/order_delivared_repository.dart';
import 'package:order_app/features/orders/data/repositoies/order_in_way_repository.dart';
import 'package:order_app/features/orders/data/repositoies/remove_order_repository.dart';
import 'package:order_app/features/orders/data/repositoies/restore_order_repository.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';
class OrdersCubit extends Cubit<OrdersState> {

  OrdersCubit() : super(OrdersInitial());

 late int currentStep ;
    eitherFailureOrGetOrders()async{
    emit(OrdersLoading());
    final failureOrGetOrders = await sl<GetOrdersRepository>().getOrders();
    failureOrGetOrders.fold(
      (failure) => emit(OrdersFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (orders) => emit(OrdersSuccessfully(ordersModel: orders)),
    );
  }


    eitherFailureOrRemoveOrder ({required int id})async{
    emit(RemoveOrdersLoading());

    final failureOrRemoveOrder = await sl<RemoveOrderRepository>().removeOrder(id: id);


    failureOrRemoveOrder.fold(
      (failure) => emit(RemoveOrdersFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) {
   emit(RemoveOrdersSuccessfully(message: message));
   eitherFailureOrGetOrders();
      } 
    );
  }
    eitherFailureOrRestore ({required int id })async{
    emit(RestoreOrdersLoading());

    final failureOrRestoreOrder = await sl<RestoreOrderRepository>().restoreOrder(id: id);


    failureOrRestoreOrder.fold(
      (failure) => emit(RestoreOrdersFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) => emit(RestoreOrdersSuccessfully(message: message)),
    );
  }
    eitherFailureOrOrderInWay ()async{

    final failureOrOrderInWay = await sl<OrderInWayRepository>().orderInWay();


    failureOrOrderInWay.fold(
      (failure) => emit(OrderInWayFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) => emit(OrderInWaySuccessfully()),
    );
  }
    eitherFailureOrOrderConfirmation ({required int orderId})async{
    emit(OrderConfiramtionLoading());

    final failureOrRemoveOrder = await sl<OrderConfirmationRepository>().orderConfirmation(orderId: orderId);


    failureOrRemoveOrder.fold(
      (failure) => emit(OrderConfirmationFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) {
        emit(OrderConfiramtionSuccessfully(message: message));
        eitherFailureOrGetOrders();
      } 
    );
  }
    eitherFailureOrOrderDelivared ({required int id})async{
    emit(OrderDelivaredLoading());

    final failureOrRemoveOrder = await sl<OrderDelivaredRepository>().delivaryOrder(id: id);

    failureOrRemoveOrder.fold(
      (failure) => emit(OrderDelivaredFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (message) {
        emit(OrderDelivaredSuccessfully(message: message));
        eitherFailureOrGetOrders();
        }
    );
  }
}
