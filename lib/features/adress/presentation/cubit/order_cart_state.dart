import 'package:order_app/core/models/sub_models/orders_item_model.dart';
import 'package:order_app/features/cart/data/models/order_cart_model.dart';

class OrderCartState {}

final class CartOrderInitial extends OrderCartState {}

final class CartOrderSuccessfuly extends OrderCartState {
  String message ;
  CartOrderSuccessfuly({required this.message});
}

final class CartOrderLoading extends OrderCartState {}

final class CartOrderFailure extends OrderCartState {
  final String errMessage;
  final String arErrMessage;

  CartOrderFailure({required this.errMessage, required this.arErrMessage});
}

class OrderInDefaultState extends OrderCartState {}

class Adreess extends OrderCartState {}
class AdreessFailure extends OrderCartState {
  
  String error ; 

  AdreessFailure({required this.error});
}

class OrderInUpdateState extends OrderCartState {
  final OrdersItemModel order;
  OrderInUpdateState({required this.order});
}



final class OrdersUpdatingLoading extends OrderCartState{}

final class OrdersUpdatingFailure extends OrderCartState{
  final String errMessage;
  final String arErrMessage;

  OrdersUpdatingFailure({required this.errMessage, required this.arErrMessage});
}

final class OrdersUpdatingSuccessfully extends OrderCartState{
  final OrderCartModel ordersModel;
  OrdersUpdatingSuccessfully({required this.ordersModel});
}







