import 'package:flutter/material.dart';
import 'package:order_app/features/products/presentation/widget/products_bloc_builder.dart';
import 'package:order_app/generated/l10n.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductHomeScreenState createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececee),
      appBar: _buildHeader(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildSearchSection(),
            
            const SizedBox(height: 20),
            ProductsBlocBuilder(isAdmin: false,),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  /// AppBar section
  AppBar _buildHeader() {
    return AppBar(
      backgroundColor: Colors.redAccent,
      leading: const Icon(Icons.arrow_back_ios_new_rounded),
      centerTitle: true,
      title:  Text(
        S.of(context).app_bar_products_screen,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.fastfood_outlined),
        )
      ],
    );
  }

  
  Padding _buildSearchSection() {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon:const  Icon(Icons.search),
          hintText: S.of(context).search_hint_product_screen,
          hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }



}
