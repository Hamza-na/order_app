import 'package:flutter/material.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';

class Order extends StatelessWidget {
  Order({super.key});

  final List<OrderItem> myOrders = [
    OrderItem(
      orderId: "#4115-5473",
      date: "٢٥ ديسمبر ٢٠٢٤",
      status: "قيد الإنتظار",
      price: "75,000 ل.س",
      title: "عصير ابو صلاح",
      image: "assets/images/shop3.jpg",
    ),
    OrderItem(
      orderId: "#4200-3690",
      date: "١٦ أغسطس ٢٠٢٤",
      status: "مدفوعة",
      price: "144,900 ل.س",
      title: "بيت المختار",
      image: "assets/images/shop3.jpg",
    ),
    OrderItem(
      orderId: "#4134-3544",
      date: "٨ أغسطس ٢٠٢٤",
      status: "مدفوعة",
      price: "121,100 ل.س",
      title: "بيت المختار",
      image: "assets/images/shop3.jpg",
    ),
  ];

  final List<OrderItem> upcomingOrders = [
    OrderItem(
      orderId: "#4751-2782",
      date: "١٣ يوليو ٢٠٢٤",
      status: "قيد الإنتظار",
      price: "50,000 ل.س",
      title: "بيت المختار",
      image: "assets/images/shop3.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            "طلباتي",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "طلباتي"),
              Tab(text: "الطلبات اللاحقة"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrdersList(orders: myOrders),
            OrdersList(orders: upcomingOrders),
          ],
        ),
        
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  final List<OrderItem> orders;

  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return GestureDetector(
          onTap: (){
            context.pushNamed(Routes.preperingOrder);
          },
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(order.image),
              ),
              title: Text(
                order.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${order.orderId}\n${order.date}"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    order.status,
                    style: TextStyle(
                      color: order.status == "قيد الإنتظار" ? Colors.orange : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(order.price),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class OrderItem {
  final String orderId;
  final String date;
  final String status;
  final String price;
  final String title;
  final String image;

  OrderItem({
    required this.orderId,
    required this.date,
    required this.status,
    required this.price,
    required this.title,
    required this.image,
  });
}

