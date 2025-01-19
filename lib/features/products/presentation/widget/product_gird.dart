import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/models/products_model.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';

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
      itemCount: products?.listOfProduct?.listOfProduct.length,
      itemBuilder: (context, index) {
        final item = products!.listOfProduct!.listOfProduct[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.productDetails,arguments: item.productModelOfResturant.id);
          },
          child: _buildProductCard(item,context),
        );
      },
    );
  }
    Widget _buildProductCard(ProductModelOfResturantWithImage ?product,BuildContext context) {
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
            child: imageOfProduct(product),
          ),
          const SizedBox(height: 10),
          Text(
            product!.productModelOfResturant.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
           "${product.productModelOfResturant.price}\$",
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
                  final isFavorite =
                      context.read<GetProductsCubit>().isFavorite(
                            product.productModelOfResturant.id,
                          );
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      isFavorite
                          ? context
                              .read<GetProductsCubit>()
                              .eitherFailureOrRemoveFromFavorite(
                                product.productModelOfResturant.id,
                              )
                          : context
                              .read<GetProductsCubit>()
                              .eitherFailureOrAddToFavorite(
                                product.productModelOfResturant.id,
                              );
                    },
              );})
        ])
            ],
          )
      );
  }

    Image imageOfProduct(ProductModelOfResturantWithImage ?product) {

      if(product?.image == null ){
      return Image.asset("assets/images/shop3.jpg",fit: BoxFit.cover,height: 100,width: 100,);
     }
      return Image.network
      (
      "${product!.image}", fit: BoxFit.cover, height: 100,width: 100,
      );

    }

}
addToFavorite(BuildContext context,int productId){
   context.read<GetProductsCubit>().eitherFailureOrAddToFavorite(productId);
}

removeFromFavorite(BuildContext context ,int productId){
  context.read<GetProductsCubit>().eitherFailureOrRemoveFromFavorite(productId);
  
}

