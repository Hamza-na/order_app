import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/models/sub_models/orders_item_model.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/screens/order_preparing%20_screen%20.dart';
import 'package:order_app/features/orders/presentation/widget/get_order_bloc_builder.dart';
import 'package:order_app/generated/l10n.dart';

class Order extends StatelessWidget {
  Order({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 1,
          title:  Text(
            S.of(context).my_orders,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const GetOrderBlocBuilder(),
        
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  final List<OrdersItemModel> ?orders;

  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    
    return orders != null?
     ListView.builder(
      itemCount: orders!.length,
      itemBuilder: (context, index) {
        final order = orders![index];
        DateTime date= DateTime.parse(order.createdAt);
        return GestureDetector(
          onTap: (){
           // context.pushNamed(Routes.preperingOrder);
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder:(context)=> BlocProvider(
              create: (context) => OrdersCubit(),
              child:  OrderStatusScreen(ordersItemModel: order),
            )
            ));
          },
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading:const  CircleAvatar(
                backgroundImage: AssetImage("assets/images/shop3.jpg"),
              ),
              // title: Text(
              //   "Order Id = ${order.id}",
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              // ),
              subtitle: Text("#${order.id}\n${date.year}/${date.month}/${date.day}"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    order.status,
                    style: TextStyle(
                      color: order.status == "Waiting for response" ? Colors.orange : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("\$${order.cartModel.cartItemModel!.totalBill}"),
                ],
              ),
            ),
          ),
        );
      },
    ): const Center(
      child: Text("there is no oreders"),
    );
  }
}


