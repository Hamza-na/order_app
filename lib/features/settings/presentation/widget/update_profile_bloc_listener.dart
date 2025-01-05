import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/products/presentation/widget/products_loader.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is UpdateProfileSuccessfully || current is UpdateProfileFailure || current is UpdateProfileLoading,
      listener: (context, state) {
        if(state is UpdateProfileSuccessfully){
          
           //ProductGird(products: state.productsModel);
        }
        else if(state is UpdateProfileFailure){
           const Text("error");
        }
        else if(state is UpdateProfileLoading){
          print("emit loading");
           const  ProductsLoader();
        }
        
      },
    );
  }
  
}