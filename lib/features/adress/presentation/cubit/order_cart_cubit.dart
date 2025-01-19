import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';
import 'package:order_app/features/adress/data/repositories/order_cart_repository.dart';
import 'package:order_app/features/adress/data/repositories/update_order_repository.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_state.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';

class OrderCartCubit extends Cubit<OrderCartState> {
  OrderCartCubit() : super(CartOrderInitial());

  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController detailsAddressController = TextEditingController();
  TextEditingController floorController = TextEditingController();

  String? defaultAddress; 
  String?address; 

  final formKey = GlobalKey<FormState>();

  void setDefaultAddress(String? userAddress) {
    defaultAddress = userAddress;
  }
  
  eitherFailureOrOrderCart() async {
    emit(CartOrderLoading());

    String ?location = address ?? defaultAddress ; 
    
    if(location == null){
      emit(AdreessFailure(error:"Location is required"));
      return ;
    }

    final failureOrOrderCart = await sl<OrderCartRepository>().orderCart(
      location:location
      );

    failureOrOrderCart.fold(
        (failure) => emit(CartOrderFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
        (order) => emit(CartOrderSuccessfuly(message: "ok")));
  }

  emitAddress(){
    emit(Adreess());
  }


  eitherFailureOrUpdatingOrders({required int orderId})async{
  emit(OrdersUpdatingLoading());

  String ?location = address ?? defaultAddress ; 
    
    if(location == null){
      emit(AdreessFailure(error:"Location is required"));
      return ;
    }

    final failureOrGetOrders = await sl<UpdateOrderRepository>().updateOrder(orderId:orderId,location: location );


    failureOrGetOrders.fold(
      (failure) => emit(OrdersUpdatingFailure(errMessage: failure.errMessage,arErrMessage: failure.arErrMessage)),
      (orders) => emit(OrdersUpdatingSuccessfully(ordersModel: orders)),
    );
  }


  Future<void> checkOrderState() async {
  final ordersCubit = sl<OrdersCubit>();
  
  if (ordersCubit.state is OrdersSuccessfully) {
    final orders = (ordersCubit.state as OrdersSuccessfully).ordersModel.ordersListModel;
    OrdersItemModel ?waitingOrPreparingOrder;
    if(orders!=null)
    { waitingOrPreparingOrder = orders.firstWhereOrNull(
      (order) => order.status == 'Waiting for response' || order.status == 'Period of editing',
    );}
    if (waitingOrPreparingOrder != null) {
      emit(OrderInUpdateState(order: waitingOrPreparingOrder));
    } else {
      emit(OrderInDefaultState());
    }
  } else {
    await ordersCubit.eitherFailureOrGetOrders();
    final orders = (ordersCubit.state as OrdersSuccessfully).ordersModel.ordersListModel;
    OrdersItemModel ?waitingOrPreparingOrder;
    if(orders!=null)
    { waitingOrPreparingOrder = orders.firstWhereOrNull(
      (order) => order.status == 'Waiting for response' || order.status == 'Period of editing',
    );
    }
    if (waitingOrPreparingOrder != null) {
      emit(OrderInUpdateState(order: waitingOrPreparingOrder));
    } else {
      emit(OrderInDefaultState());
    }
  }
}
}
