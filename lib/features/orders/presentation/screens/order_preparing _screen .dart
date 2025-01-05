import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';
import 'package:order_app/features/orders/presentation/cubit/admin_response_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/admin_response_state.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_state.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key, required this.ordersItemModel});

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
      case 'Preparing':
        return 1;
      case 'In Way':
        return 2;
      case 'Delivered':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.read<OrdersCubit>().eitherFailureOrRemoveOrder(
                    id: widget.ordersItemModel.id,
                );
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              context.pushNamed('/editOrder');
            },
            icon: const Icon(Icons.edit),
          ),
        ],
        elevation: 1,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AdminResponseCubit, AdminResponseState>(
            listener: (context, state) {
              if (state is AdminResponseSuccessfully) {
                setState(() {
                  currentStep = 1; // Set currentStep to 1 when Admin response is successful
                });
              }
            },
          ),
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
              } else if (state is OrdersSuccessfully) {
                setState(() {
                  currentStep = _getStepFromStatus(widget.ordersItemModel.status);
                });
              }
            },
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOrderInfoCard(),
            _buildOrderStatusCard(context, currentStep),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoCard() {
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
              child: Image.asset(
                "assets/images/product_images/shope2.jpg",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    // ! todo
                    "ordersItemModel.name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Quantity: ${widget.ordersItemModel}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Total: ${widget.ordersItemModel} SYP",
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
  Widget _buildOrderStatusCard(BuildContext context, int currentStep) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
            "Order Status: ${widget.ordersItemModel.status}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (currentStep == 1 || currentStep == 2)
            TimerWidget(
              minutes: 3,
              onTimeout: () {
                if (currentStep == 1) {
                  context.read<OrdersCubit>().eitherFailureOrOrderConfirmation(
                        orderId: widget.ordersItemModel.id,
                      );
                } else if (currentStep == 2) {
                  context.read<OrdersCubit>().eitherFailureOrOrderDelivared(
                        id: widget.ordersItemModel.id,
                      );
                }
              },
            ),
          const SizedBox(height: 16),
          _buildProgressBar(currentStep),
        ],
      ),
    );
  }

  /// Progress Bar
  Widget _buildProgressBar(int currentStep) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStepIcon(Icons.pending_actions, "Waiting", 0, currentStep),
        _buildStepLine(0, currentStep),
        _buildStepIcon(Icons.local_dining, "Preparing", 1, currentStep),
        _buildStepLine(1, currentStep),
        _buildStepIcon(Icons.directions_car, "In Way", 2, currentStep),
        _buildStepLine(2, currentStep),
        _buildStepIcon(Icons.check_circle, "Delivered", 3, currentStep),
      ],
    );
  }

  Widget _buildStepIcon(IconData icon, String label, int step, int currentStep) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: step <= currentStep ? primaryColor : Colors.grey,
          child:
              Icon(icon, color: step <= currentStep ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: step <= currentStep ? primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(int step, int currentStep) {
    return Expanded(
      child: Container(
        height: 2,
        color: step < currentStep ? primaryColor : Colors.grey,
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

