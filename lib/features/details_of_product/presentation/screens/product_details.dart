import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/details_of_product/data/models/add_and_remove_from_cart_response.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_state.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_state.dart';
import 'package:order_app/features/details_of_product/presentation/widget/add_to_cart_bloc_listener.dart';
import 'package:order_app/generated/l10n.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddAndRemoveFromCartCubit, AddAndRemoveFromCartState>(
          listener: (context, state) {
            if (state is AddToCartFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, productDetailsState) {
          if (productDetailsState is GetProductDetailsSuccessfully) {
            final product = productDetailsState.getProductDetailsModel;
            return SingleChildScrollView(
              child: Column(
                children: [
                  productImage(product),
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
                            productName(product),
                            productPrice(product),
                          ],
                        ),
                        const SizedBox(height: 20),
                        productRating(context),
                        const SizedBox(height: 25),
                        productDetailsText(context),
                        const SizedBox(height: 8),
                        productDescription(product),
                        const SizedBox(height: 8),
                        BlocBuilder<AddAndRemoveFromCartCubit, AddAndRemoveFromCartState>(
                          builder: (context, cartState) {
                            AddAndRemoveFromCartResponse? response;
                            if (cartState is AddToCartSuccessfully || cartState is RemoveFromCartSuccessfuly) {
                              response = (cartState as dynamic).addAndRemoveFromCartResponse;
                            }
                            return cartControls(context, product, response);
                          }
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (productDetailsState is GetProductDetailsFailure) {
            return const Center(child: Text('Error loading product details'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Widget for cart controls
  Widget cartControls(
      BuildContext context, ProductModelOfResturantWithImage product,AddAndRemoveFromCartResponse? data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("Available Quantity:"),
                Text(
                    '${data == null ? product.productModelOfResturant.availableQuantity :  data.availableQuantity}'),
              ],
            ),
            Row(
              children: [
                addProductIcon(context, product.productModelOfResturant.id),
                Text(
                  "${ data == null ?product.productModelOfResturant.countInCart :data.quantityInCart}",
                  style: const TextStyle(fontSize: 18),
                ),
                removeProductIcon(context, product.productModelOfResturant.id),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price: \$${data == null ? ((product.productModelOfResturant.countInCart) * (product.productModelOfResturant.price)).toStringAsFixed(2):data.totalPrice}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            addToCartButton(context),
          ],
        ),
      ],
    );
  }

  IconButton removeProductIcon(BuildContext context, int id) {
    return IconButton(
      onPressed: () {
        context
            .read<AddAndRemoveFromCartCubit>()
            .eitherFailureOrRemoveFromCart(id);
        const AddToCartBlocListener();
      },
      icon: const Icon(Icons.remove_circle_outline,
          color: Color.fromRGBO(255, 82, 82, 1)),
    );
  }

  IconButton addProductIcon(BuildContext context, int id) {
    return IconButton(
      onPressed: () {
        context.read<AddAndRemoveFromCartCubit>().eitherFailureOrAddToCart(id);
        const AddToCartBlocListener();
      },
      icon: const Icon(Icons.add_circle_outline,
          color: Color.fromRGBO(255, 82, 82, 1)),
    );
  }

  ElevatedButton addToCartButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(255, 82, 82, 1),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            // vertical: 12,
          ),
        ),
        onPressed: () {
          context.pushNamed(Routes.cartScreen);
        },
        child: Row(
          children: [
            Text(
              S.of(context).show_cart,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(
              width: 14,
            ),
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          ],
        ));
  }

  Row productRating(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 25),
        const Icon(Icons.star, color: Colors.amber, size: 25),
        const Icon(Icons.star, color: Colors.amber, size: 25),
        const Icon(Icons.star_half, color: Colors.amber, size: 25),
        const SizedBox(width: 8),
        Text(
          S.of(context).rating,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const Spacer(),
        Text(
          S.of(context).time,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Text productDescription(ProductModelOfResturantWithImage productDetails) {
    return Text(
      productDetails.productModelOfResturant.descrption,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Text productDetailsText(BuildContext context) {
    return Text(
      S.of(context).details,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text productPrice(ProductModelOfResturantWithImage productDetails) {
    return Text(
      '\$${productDetails.productModelOfResturant.price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 20,
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text productName(ProductModelOfResturantWithImage productDetails) {
    return Text(
      productDetails.productModelOfResturant.name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Center productImage(ProductModelOfResturantWithImage product) {
    String? image = product.image;

    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        child: product.image == null
            ? Image.asset(
                'assets/images/product_images/shope.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.network(
                image!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
