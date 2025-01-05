import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/models/sub_models/cart_product_model.dart';
import 'package:order_app/core/widgets/custom_card.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/widget/remove_from_favorite_bloc_listener.dart';

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
            color: primaryColor,
            fontSize: 15,
          ),
        ),
        actions: const [
          Icon(Icons.favorite, color: Colors.red, size: 13),
        ],
      ),
      body: 
          BlocBuilder<FavoriteProductsCubit,FavoriteProductsState>(
            builder:(contex,state) {
              if(state is FavoriteSuccessfuly){
              final List<CartProductModel> ?model = state.favoriteProductsModel?.favoriateProductsModel;
              return model!=null ? ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  final product = model[index];
                  return CustomCard(
                    imageUrl: product.base64Image,
                    title: product.name,
                    icon: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red, size: 20),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Are you sure to unfavorite?'),
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
                                  removeFromFavorite(context, product.productId);
                                  },
                                  child: const Text('Continue'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: model.length
              ):
              const Center(
              child: Text('No Favorite products'),
            );
            }
            if(state is FavoriteFailure){
              return const Text("errorrr!!!!!!!!!!!!!");
            }
            return const SizedBox.shrink();
            }
          )
    );
  }
}

void removeFromFavorite(BuildContext context, int productId) {
  RemoveFromFavoriteBlocListener(productId: productId);
  context.read<GetProductsCubit>().eitherFailureOrRemoveFromFavorite(productId);
}
