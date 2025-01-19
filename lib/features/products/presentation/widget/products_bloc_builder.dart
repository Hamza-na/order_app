import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/admin/presentation/screens/products_admin_view.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';
import 'package:order_app/features/products/presentation/widget/product_gird.dart';
import 'package:order_app/features/products/presentation/widget/products_loader.dart';

class ProductsBlocBuilder extends StatelessWidget {
  ProductsBlocBuilder({super.key,required this.isAdmin});

  bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsSuccessfully || current is GetProductsFailure || current is GetProductsLoading,
      builder: (context, state) {
        if(state is GetProductsSuccessfully){
          return isAdmin?ProductsAdminView(productsModel: state.productsModel,onBack: (){},):ProductGird(products: state.productsModel);
        }
        else if(state is GetProductsFailure){
          return Center(child: const Text("error"));
        }
        else if(state is GetProductsLoading){
          return  isAdmin?const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          ):const ProductsLoader();
        }
        return const SizedBox.shrink();
      },
    );
  }
  
}