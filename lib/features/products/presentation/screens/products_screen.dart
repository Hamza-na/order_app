import 'package:flutter/material.dart';
import 'package:order_app/features/home/presentation/widget/food_categorie.dart';
import 'package:order_app/features/products/presentation/widget/products_bloc_builder.dart';

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
            _buildCategoriesSection(),
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
      title: const Text(
        "Search Foods",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          hintText: "Search for food...",
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// Food Categories (placeholder)
  Widget _buildCategoriesSection() {
    return const FoodCategoriesWidget();
  }



  /// Single Product Card


}
