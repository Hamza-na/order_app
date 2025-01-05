import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/details_of_product/presentation/widget/product_details_bloc_builder.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: productDetailAppBar(),
      body:const ProductDetailsBlocBuilder(),
    );
  }

    AppBar productDetailAppBar() {
    return AppBar(
      title: const  Text("Product Details"),
      backgroundColor: primaryColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }
}