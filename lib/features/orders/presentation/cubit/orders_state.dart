
import 'package:order_app/core/models/orders_model.dart';

class OrdersState {}

final class OrdersInitial extends OrdersState {}


final class OrdersLoading extends OrdersState{}

final class OrdersFailure extends OrdersState{
  final String errMessage;
  final String arErrMessage;

  OrdersFailure({required this.errMessage, required this.arErrMessage});
}
final class OrdersSuccessfully extends OrdersState{
  final OrdersModel ordersModel;
  OrdersSuccessfully({required this.ordersModel});
}

final class RemoveOrdersLoading extends OrdersState{}

final class RemoveOrdersFailure extends OrdersState{
 final String errMessage;
  final String arErrMessage;

  RemoveOrdersFailure({required this.errMessage, required this.arErrMessage});
}
final class RemoveOrdersSuccessfully extends OrdersState{
  final dynamic message;
  RemoveOrdersSuccessfully({required this.message});
}


final class RestoreOrdersLoading extends OrdersState{}

final class RestoreOrdersFailure extends OrdersState{
  final String errMessage;
  final String arErrMessage;

  RestoreOrdersFailure({required this.errMessage, required this.arErrMessage});
}
final class RestoreOrdersSuccessfully extends OrdersState{
  final dynamic message;
  RestoreOrdersSuccessfully({required this.message});
}

final class OrderConfiramtionLoading extends OrdersState{}

final class OrderConfirmationFailure extends OrdersState{
 final String errMessage;
  final String arErrMessage;

  OrderConfirmationFailure({required this.errMessage, required this.arErrMessage});
}
final class OrderConfiramtionSuccessfully extends OrdersState{
  final dynamic message;
  OrderConfiramtionSuccessfully({required this.message});
}

final class OrderDelivaredLoading extends OrdersState{}

final class OrderDelivaredFailure extends OrdersState{
  final String errMessage;
  final String arErrMessage;

  OrderDelivaredFailure({required this.errMessage, required this.arErrMessage});
}
final class OrderDelivaredSuccessfully extends OrdersState{
  final dynamic message;
  OrderDelivaredSuccessfully({required this.message});
}
final class OrderInWayFailure extends OrdersState{
  final String errMessage;
  final String arErrMessage;

  OrderInWayFailure({required this.errMessage, required this.arErrMessage});
}
final class OrderInWaySuccessfully extends OrdersState{
  // final dynamic message;
  OrderInWaySuccessfully(
    //required this.message
    );
}


