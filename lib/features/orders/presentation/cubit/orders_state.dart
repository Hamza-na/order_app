
import 'package:order_app/core/models/orders_model.dart';

class OrdersState {}

final class OrdersInitial extends OrdersState {}


final class OrdersLoading extends OrdersState{}

final class OrdersFailure extends OrdersState{
  final String errMessage;

  OrdersFailure({required this.errMessage});
}
final class OrdersSuccessfully extends OrdersState{
  final OrdersModel ordersModel;
  OrdersSuccessfully({required this.ordersModel});
}

final class RemoveOrdersLoading extends OrdersState{}

final class RemoveOrdersFailure extends OrdersState{
  final String errMessage;

  RemoveOrdersFailure({required this.errMessage});
}
final class RemoveOrdersSuccessfully extends OrdersState{
  final dynamic message;
  RemoveOrdersSuccessfully({required this.message});
}


final class RestoreOrdersLoading extends OrdersState{}

final class RestoreOrdersFailure extends OrdersState{
  final String errMessage;

  RestoreOrdersFailure({required this.errMessage});
}
final class RestoreOrdersSuccessfully extends OrdersState{
  final dynamic message;
  RestoreOrdersSuccessfully({required this.message});
}

final class OrderConfiramtionLoading extends OrdersState{}

final class OrderConfirmationFailure extends OrdersState{
  final String errMessage;

  OrderConfirmationFailure({required this.errMessage});
}
final class OrderConfiramtionSuccessfully extends OrdersState{
  final dynamic message;
  OrderConfiramtionSuccessfully({required this.message});
}

final class OrderDelivaredLoading extends OrdersState{}

final class OrderDelivaredFailure extends OrdersState{
  final String errMessage;

  OrderDelivaredFailure({required this.errMessage});
}
final class OrderDelivaredSuccessfully extends OrdersState{
  final dynamic message;
  OrderDelivaredSuccessfully({required this.message});
}


