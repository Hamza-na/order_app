import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/models/products_model.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';
import 'package:order_app/features/products/presentation/widget/add_to_favorite_bloc_listener.dart';
import 'package:order_app/features/products/presentation/widget/remove_from_favorite_bloc_listener.dart';

class ProductGird extends StatelessWidget {
   ProductGird({super.key,this.products});
  
  ProductsModel ?products;

  @override
  Widget build(BuildContext context) {
    return  MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemCount: products?.marketModel.listOfProduct.listOfProduct.length,
      itemBuilder: (context, index) {
        final item = products!.marketModel.listOfProduct.listOfProduct[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.productDetails,arguments: item.id);
          },
          child: _buildProductCard(item,context),
        );
      },
    );
  }
    Widget _buildProductCard(ProductModelOfResturant ?product,BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/shop3.jpg",
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product!.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            products!.marketModel.name,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const  Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  SizedBox(width: 5),
                  Text("5"),
                ],
              ),
              BlocBuilder<GetProductsCubit, GetProductsState>(
                builder: (context, state) {
                  final isFavorite = context.read<FavoriteProductsCubit>().getIdOfFavoriteProducts;
                  return IconButton(
                    icon:Icon(
                      Icons.abc
                    ) ,
                    onPressed: () {},
                    // icon: Icon(
                    //   isFavorite ? Icons.favorite : Icons.favorite_outline,
                    //   color: isFavorite ? Colors.red : Colors.grey,
                    // ),
                    // onPressed: () {
                    //   isFavorite
                    //       ? removeFromFavorite(context, product.id)
                    //       : addToFavorite(context, product.id);
                    // },
                );
                })
            ],
          ),
        ],
      ),
    );
  }
}
addToFavorite(BuildContext context,int productId){
   context.read<GetProductsCubit>().eitherFailureOrAddToFavorite(productId);
  AddToFavoriteBlocListener(productId:productId,);
 
}

removeFromFavorite(BuildContext context ,int productId){
  context.read<GetProductsCubit>().eitherFailureOrRemoveFromFavorite(productId);
  RemoveFromFavoriteBlocListener(productId: productId);
  
}

