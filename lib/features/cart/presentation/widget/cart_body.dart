import 'package:flutter/material.dart';
import 'package:order_app/core/models/cart_model.dart';
import 'package:order_app/core/models/sub_models/cart_product_model_with_image.dart';

class CartBody extends StatelessWidget {
  final CartModel cartModel;
  const CartBody({super.key, required this.cartModel});
  @override
  Widget build(BuildContext context) {
    return cartModel.cartItemModel?.products == null
        ? const Center(
            child: Text("The Cart is Empty !"),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => _CardProductCart(
              cartModel.cartItemModel!.products![index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: cartModel.cartItemModel!.products!.length,
          );
  }
}

class _CardProductCart extends StatelessWidget {
  final CartProductModelWithImage cart;

  const _CardProductCart(this.cart);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            _productImage(),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    cart.cartProductModel.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cart.cartProductModel.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cart.cartProductModel.totalPrice}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "x${cart.cartProductModel.quantity}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ]))
          ]))
    ]);
  }

  Widget _productImage() {
    String? image = cart.image;
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: image != null
            ? Image.network(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/shop4.jpg",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ));
  }
}
