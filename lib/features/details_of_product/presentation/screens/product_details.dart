import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/details_of_product/data/models/get_product_details_model.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_to_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/widget/add_to_cart_bloc_listener.dart';

class ProductDetails extends StatelessWidget {

  ProductDetails({super.key, required this.productDetails});
  GetProductDetailsModel productDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          productImage(),
          const SizedBox(height: 16),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    productName(),
                    productPrice(),
                  ],
                ),
                const SizedBox(height: 20),
                productRating(),
                const SizedBox(height: 25),
                productDetailsText(),
                const SizedBox(height: 8),
                productDescription(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    productQuantity(),
                    Row(
                      children: [
                        addProductIcon(),
                        Text(
                          '${productDetails.productModelOfResturant.availableQuantity}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        removeProductIcon(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price: \$${12.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    addToCartButton(context),
                    const AddToCartBlocListener(),
                  ],
                  
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton addToCartButton(BuildContext context){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(255, 82, 82, 1),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onPressed: () {
          context.read<AddToCartCubit>().eitherFailureOrAddToCart(1);
        },
        child: const Row(
          children: [
            Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              width: 14,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          ],
        ));
  }

  Row productRating() {
    return const Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 25),
        Icon(Icons.star, color: Colors.amber, size: 24),
        Icon(Icons.star, color: Colors.amber, size: 25),
        Icon(Icons.star, color: Colors.amber, size: 25),
        Icon(Icons.star_half, color: Colors.amber, size: 25),
        SizedBox(width: 8),
        Text(
          '4.5 Rating',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Spacer(),
        Text(
          '15 min',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  IconButton removeProductIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.add_circle_outline,
          color: Color.fromRGBO(255, 82, 82, 1)),
    );
  }

  IconButton addProductIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.remove_circle_outline,
          color: Color.fromRGBO(255, 82, 82, 1)),
    );
  }

  Text productQuantity() {
    return const Text(
      'Quantity',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text productDescription() {
    return Text(
      productDetails.productModelOfResturant.descrption,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Text productDetailsText() {
    return const Text(
      'Details',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text productPrice() {
    return Text(
      '\$${productDetails.productModelOfResturant.price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 20,
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text productName() {
    return Text(
      productDetails.productModelOfResturant.name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Center productImage() {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        child: Image.asset(
          'assets/images/product_images/shope.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
