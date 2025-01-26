import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/models/sub_models/cart_product_model_with_image.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';
import 'package:order_app/generated/l10n.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key, 
  required this.ordersItemModel
  });
  final OrdersItemModel ordersItemModel;

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  int currentStep = 0;
  int _getStepFromStatus(String status) {
    switch (status) {
      case 'Waiting for response':
        return 0;
      case 'Period of editing':
        return 1;
      case 'In way':
        return 2;
      case 'Delivered':
        return 3;
      default:
        return 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    currentStep = _getStepFromStatus(widget.ordersItemModel.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:MultiBlocListener(
        listeners: [
          BlocListener<OrdersCubit, OrdersState>(
            listener: (context, state) {
              if (state is OrderConfiramtionSuccessfully) { 
                setState(() {
                  currentStep = 2;
                });
              } else if (state is OrderDelivaredSuccessfully) {
                setState(() {
                  currentStep = 3;
                });
              }
            },
          ),
        ],
        
        child: Container(
          height: 200,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          //color: Colors.white,
          gradient: const LinearGradient(colors: [
            primaryColor,
            secondColor
          ]) ,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              "Order Status:${widget.ordersItemModel.status}",
              
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (currentStep == 1 || currentStep == 2)
              TimerWidget(
                minutes: 1,
                onTimeout: () {
                  if (currentStep == 1) {
                    context.read<OrdersCubit>().eitherFailureOrOrderConfirmation(
                          orderId: widget.ordersItemModel.id,
                        );
                        widget.ordersItemModel.status = "In Way";
                        setState(() {
                          currentStep = 2;
                        });
                  } else if (currentStep == 2) {
                    context.read<OrdersCubit>().eitherFailureOrOrderDelivared(
                          id: widget.ordersItemModel.id,
                        );
                        widget.ordersItemModel.status = "Delivered";
                        setState(() {
                          currentStep = 3;
                        });
                  }
                },
              ),
            const SizedBox(height: 16),
            _buildProgressBar(currentStep),
          ],
        ),
            ),
      ) ,
      appBar: AppBar(
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
  IconButton(
    onPressed: (){
      if(widget.ordersItemModel.status == "Waiting for response") // Waiting for response
          {
            context.read<OrdersCubit>().eitherFailureOrRemoveOrder(
                  id: widget.ordersItemModel.id,
              );
              widget.ordersItemModel.status = "Deleted";
              setState(() {
                
              });
          }
        else if(widget.ordersItemModel.status == "Deleted") {
          context.read<OrdersCubit>().eitherFailureOrRestore(id: widget.ordersItemModel.id);
          widget.ordersItemModel.status = "Waiting for response";
          setState(() {
            currentStep = 0;
          });
        }
        else if(widget.ordersItemModel.status == "Rejected") {
          context.read<OrdersCubit>().eitherFailureOrRestore(id: widget.ordersItemModel.id);
          widget.ordersItemModel.status = "Waiting for response";
          setState(() {
            currentStep = 0;
          });
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Cannot delete this order in the current state")),
          );
        }
    },
    icon: widget.ordersItemModel.status == "Deleted" ||
    widget.ordersItemModel.status == "Rejected"  ? Icon(Icons.refresh, color: Colors.red): const Icon(Icons.delete, color: Colors.red),
  ),
  IconButton(
    onPressed: (currentStep == 0 || currentStep == 1) 
        ? () {
          context.pushNamed(Routes.entryPoint);
          }
        : () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Cannot edit this order in the current state")),
          );
        }, 
    icon: const Icon(Icons.edit),
  ),
],

        elevation: 1,
      ),
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                    //padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) => buildOrderInfoCard(
                      product: widget.ordersItemModel.cartModel.cartItemModel!.products![index]
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount:widget.ordersItemModel.cartModel.cartItemModel!.products!.length,
                  ),
            ),
          ],
        ),
      );
  }

Widget buildOrderInfoCard({required CartProductModelWithImage product}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:product.image == null? 
              Image.asset("assets/images/product_images/shope2.jpg",width: 80,
                height: 80,
                fit: BoxFit.cover,):
              Image.network(
              product.image ?? "",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // ! todo
                    product.cartProductModel.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Quantity:${product.cartProductModel.quantity}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Total:${product.cartProductModel.totalPrice} SYP",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Order Status Card
 

  /// Progress Bar
  Widget _buildProgressBar(int currentStep) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStepIcon(Icons.pending_actions, S.of(context).waiting_for_response, 0, currentStep),
        _buildStepLine(0, currentStep),
        _buildStepIcon(Icons.local_dining, S.of(context).period_of_editing, 1, currentStep),
        _buildStepLine(1, currentStep),
        _buildStepIcon(Icons.directions_car, S.of(context).in_way, 2, currentStep),
        _buildStepLine(2, currentStep),
        _buildStepIcon(Icons.check_circle, S.of(context).delivered, 3, currentStep),
      ],
    );
  }

  Widget _buildStepIcon(IconData icon, String label, int step, int currentStep) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: step <= currentStep ? Colors.white : Colors.grey,
          child:
              Icon(icon, color: step <= currentStep ? primaryColor : Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: step <= currentStep ? Colors.white : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(int step, int currentStep) {
    return Expanded(
      child: Container(
        height: 2,
        color: step < currentStep ? Colors.white : Colors.grey,
      ),
    );
  }
}
class TimerWidget extends StatefulWidget {
  final int minutes;
  final VoidCallback onTimeout;

  const TimerWidget({super.key, required this.minutes, required this.onTimeout});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}


class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.minutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
          widget.onTimeout();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;

    return Text(
      '$minutes:${seconds.toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

