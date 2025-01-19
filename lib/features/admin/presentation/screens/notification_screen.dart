import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  void _onAcceptOrder(int orderId,BuildContext context) {
    context.read<AdminCubit>().eitherFailureOrAdminResponse(orderId, true);
  }

  void _onRejectOrder(int orderId,BuildContext context) {
    context.read<AdminCubit>().eitherFailureOrAdminResponse(orderId, false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        if (state is AdminNotificationSuccessfully) {
          return ListView.builder(
            itemCount: state.notificationResponseModel.orderNotiModel.length,
            itemBuilder: (context, index) {
              final notification =
                  state.notificationResponseModel.orderNotiModel[index];

              return LayoutBuilder(
                builder: (context, constraints) {
                  double cardWidth = constraints.maxWidth * 0.9; // 90% of the available width
                  return Center(
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: cardWidth,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID: ${notification.orderId}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('User ID: ${notification.userId}'),
                            Text('Location: ${notification.location}'),
                            Text('Updated: ${notification.updated == 1 ? "Yes" : "No"}'),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _onAcceptOrder(notification.orderId,context),
                                  child: const Text('Yes'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => _onRejectOrder(notification.orderId,context),
                                  child: const Text('No'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
