import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/models/cart_model.dart';
import 'package:order_app/core/models/sub_models/cart_product_model.dart';

class CartBody extends StatelessWidget {
  final CartModel cartModel;

  const CartBody({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) => _CardProductCart(
        isRTL,
        cartModel.cartItemModel.products[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: cartModel.cartItemModel.products.length,
    );
  }
}

class _CardProductCart extends StatelessWidget {
  final bool isRTL;
  final CartProductModel cart;

  const _CardProductCart(this.isRTL, this.cart);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              _productImage(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cart.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text("This is category",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text("\$${cart.totalPrice}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: isRTL ? 5 : 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_rounded,
                    color: Colors.red, size: 20),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_outlined,
                          color: Colors.black),
                      iconSize: 18,
                    ),
                    Text('${cart.quantity}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_outlined,
                          color: secondColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _productImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/images/product_images/shope2.jpg",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
