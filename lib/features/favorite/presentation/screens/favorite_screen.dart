import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favorites",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
    
      ),
      body: BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
        builder: (context, state) {
          if (state is FavoriteSuccessfuly) {
            final List<ProductModelOfResturantWithImage>? model =
                state.favoriteProductsModel?.favoriateProductsModel;

            if (model != null && model.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemBuilder: (context, index) {
                  final product = model[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              product.image ?? "assets/images/shop3.jpg",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product.productModelOfResturant.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.favorite, color: Colors.red, size: 20),
                                      onPressed: () {
                                        _showUnfavoriteDialog(context, product.productModelOfResturant.id);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product.productModelOfResturant.descrption,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: model.length,
              );
            } else {
              return const Center(
                child: Text(
                  "No Favorite Products",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
          }

          if (state is FavoriteFailure) {
            return const Center(
              child: Text(
                "Error loading favorites!",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }

          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showUnfavoriteDialog(BuildContext context, int productId) {
  
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
                          value: context.read<GetProductsCubit>(),
                          child: 
         AlertDialog(
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to remove this product from favorites?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                _removeFromFavorite(context, productId);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        )));
      }
  }

  void _removeFromFavorite(BuildContext context, int productId) {
  context.read<GetProductsCubit>().eitherFailureOrRemoveFromFavorite(productId).then((_) {
    context.read<FavoriteProductsCubit>().eitherFailureOrGetFavorite();
  });
}

