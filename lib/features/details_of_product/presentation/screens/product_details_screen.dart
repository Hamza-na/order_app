import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/details_of_product/presentation/screens/product_details.dart';
import 'package:order_app/generated/l10n.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: productDetailAppBar(context),
      body: ProductDetails(),
    );
  }

    AppBar productDetailAppBar(BuildContext context) {
    return AppBar(
      title:   Text(S.of(context).app_bar_products_details_screen),
      backgroundColor: primaryColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }
}