import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:order_app/features/admin/presentation/screens/dash_board_screen.dart';
import 'package:order_app/features/admin/presentation/screens/login_admin_screen.dart';
import 'package:order_app/features/admin/presentation/screens/products_admin_view.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_cubit.dart';
import 'package:order_app/features/adress/presentation/screens/address_screen.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:order_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/screens/product_details_screen.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:order_app/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/orders/presentation/screens/order.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/screens/products_screen.dart';
import 'package:order_app/features/home/presentation/entry_point.dart';
import 'package:order_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:order_app/features/login/presentation/screens/login_screen.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/features/settings/presentation/screens/account_screen.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:order_app/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:order_app/features/splash_screen/presentation/splash_screen.dart';

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
            create: (context) => sl<GetProductsCubit>()
              ..eitherFailureOrGetProducts(marketId)
              ..loadFavoriteIds(),
            child: const ProductsScreen(),
          ),
        );

      case Routes.entryPoint:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => MarketsCubit(),
                    ),
                  ],
                  child: const EntryPoint(),
                ));

      case Routes.productDetails:
        final productId = arguments as int;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => sl<GetProductDetailsCubit>()
                        ..eitherFailureOrGetProductDetails(productId),
                    ),
                    BlocProvider(
                      create: (context) => sl<AddAndRemoveFromCartCubit>(),
                    ),
                  ],
                  child: const ProductDetailsScreen(),
                ));

      case Routes.addressScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => OrderCartCubit()..checkOrderState(),
              ),
              BlocProvider(
                create: (context) => ProfileCubit()..eitherFailureOrGetMe(),
              ),
            ],
            child: const AddressScreen(),
          ),
        );

      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FavoriteProductsCubit()..eitherFailureOrGetFavorite(),
              ),
              BlocProvider(
                create: (context) => sl<GetProductsCubit>(),
              ),
            ],
            child: FavoriteScreen(),
          ),
        );

      case Routes.settingsScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          ProfileCubit()..eitherFailureOrGetMe(),
                    ),
                    BlocProvider(
                      create: (context) => LogOutCubit(),
                    ),
                  ],
                  child: SettingScreen(),
                ));

      case Routes.cartScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CartCubit()..eitherFailureOrGetCart(),
                  child: const CartScreen(),
                ));

      case Routes.order:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OrdersCubit()..eitherFailureOrGetOrders(),
            child: Order(),
          ),
        );

      // case Routes.preperingOrder:
      //   return MaterialPageRoute(builder: (context) => const OrderStatusScreen());

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.adminScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => sl<AdminCubit>(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          MarketsCubit()..eitherFailureOrMarktes(),
                    ),
                    BlocProvider(
                      create: (context) => sl<GetProductsCubit>(),
                    )
                  ],
                  child: const DashboardScreen(),
                ));

      case Routes.loginAdminScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginAdminScreen(),
                ));
      case Routes.productAdminScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => sl<AdminCubit>(),
                  child: ProductsAdminView(
                    onBack: () {},
                  ),
                ));
      default:
        return null;
    }
  }
}
