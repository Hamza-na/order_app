import 'package:order_app/core/models/orders_model.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';

class OrderCartState {}

final class CartOrderInitial extends OrderCartState {}

final class CartOrderSuccessfuly extends OrderCartState {
  String message ;
  CartOrderSuccessfuly({required this.message});
}

final class CartOrderLoading extends OrderCartState {}

final class CartOrderFailure extends OrderCartState {
  String errMessage ;

  CartOrderFailure({required this.errMessage});
}

class OrderInDefaultState extends OrderCartState {}

class OrderInUpdateState extends OrderCartState {
  final OrdersItemModel order;
  OrderInUpdateState({required this.order});
}



final class OrdersUpdatingLoading extends OrderCartState{}

final class OrdersUpdatingFailure extends OrderCartState{
  final String errMessage;

  OrdersUpdatingFailure({required this.errMessage});
}

final class OrdersUpdatingSuccessfully extends OrderCartState{
  final OrdersModel ordersModel;
  OrdersUpdatingSuccessfully({required this.ordersModel});
}







