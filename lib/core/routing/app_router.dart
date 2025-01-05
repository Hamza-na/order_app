import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:order_app/features/admin/presentation/screens/dash_board_screen.dart';
import 'package:order_app/features/admin/presentation/screens/login_admin_screen.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_cubit.dart';
import 'package:order_app/features/adress/presentation/screens/address_screen.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_to_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/screens/product_details_screen.dart';
import 'package:order_app/features/on_boarding/presentation/on_boarding.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/screens/order.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/screens/products_screen.dart';
import 'package:order_app/features/home/presentation/entry_point.dart';
import 'package:order_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:order_app/features/login/presentation/screens/login_screen.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:order_app/features/sign_up/presentation/screens/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignUpCubit(),
                  child: const SignUpScreen(),
                ));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
                
      case Routes.productScreen:
        final marketId = arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                GetProductsCubit()..eitherFailureOrGetProducts(marketId),
            child: const ProductsScreen(),
          ),
        );


      case Routes.entryPoint:
        return MaterialPageRoute(
          builder: (_)=>MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context)=>MarketsCubit()..eitherFailureOrMarktes(),
                ),
            ],
            child: const EntryPoint(),
          )
          );
      case Routes.productDetails:
        final productId = arguments as int;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetProductDetailsCubit()
                        ..eitherFailureOrGetProductDetails(productId),
                    ),
                    BlocProvider(
                      create: (context) => AddToCartCubit(),
                    ),
                  ],
                  child: const ProductDetailsScreen(),
                ));
      case Routes.addressScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OrderCartCubit(),
            child: const AddressScreen(),
          ),
        );
      case Routes.ordersScreen:
        return MaterialPageRoute(builder: (context) =>  Order());
      case Routes.order:
        return MaterialPageRoute(
          builder: (_)=> BlocProvider(
            create: (context) => OrdersCubit(),
            child:  Order(),
          ));
      case Routes.preperingOrder:
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case Routes.adminScreen:
        return MaterialPageRoute(
          builder: (context) =>  MultiBlocProvider(
            providers:[
              BlocProvider(
                create: (context)=> AdminCubit(),
                ),
              BlocProvider(
                create: (context)=> MarketsCubit(),
                ) ,
              BlocProvider(
                create: (context)=> GetProductsCubit(),
                ) 
            ],
            child: const  DashboardScreen(),
          )
          );
      case Routes.loginAdminScreen:
        return MaterialPageRoute(
          builder: (context) =>  BlocProvider(
            create: (context) => LoginCubit(),
            child:const LoginAdminScreen() ,
          )
          );
      default:
        return null;
    }
  }
}
