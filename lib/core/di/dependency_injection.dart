import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:order_app/core/databases/api/dio_consumer.dart';
import 'package:order_app/features/admin/data/datasource/admin_notification_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/admin_response_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/create_market_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/create_product_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/delete_market_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/delete_product_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/to_admin_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/to_user_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/update_market_remote_data_source.dart';
import 'package:order_app/features/admin/data/datasource/update_product_remote_data_source.dart';
import 'package:order_app/features/admin/data/repositories/admin_notification_repository.dart';
import 'package:order_app/features/admin/data/repositories/admin_response_repository.dart';
import 'package:order_app/features/admin/data/repositories/create_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/create_product_repository.dart';
import 'package:order_app/features/admin/data/repositories/delete_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/delete_product_repository.dart';
import 'package:order_app/features/admin/data/repositories/to_admin_repository.dart';
import 'package:order_app/features/admin/data/repositories/to_user_repository.dart';
import 'package:order_app/features/admin/data/repositories/update_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/update_product_repository.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:order_app/features/adress/data/datasource/update_order_remote_data_source.dart';
import 'package:order_app/features/adress/data/repositories/update_order_repository.dart';
import 'package:order_app/features/cart/data/datasource/get_cart_remote_data_source.dart';
import 'package:order_app/features/adress/data/datasource/order_cart_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/datasource/remove_product_from_cart_remote_data_source.dart';
import 'package:order_app/features/cart/data/repositories/get_cart_repository.dart';
import 'package:order_app/features/adress/data/repositories/order_cart_repository.dart';
import 'package:order_app/features/details_of_product/data/repositories/remove_product_from_cart_repository.dart';
import 'package:order_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:order_app/features/details_of_product/data/datasource/add_to_cart_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/datasource/get_product_details_remote_data_source.dart';
import 'package:order_app/features/details_of_product/data/repositories/add_to_cart_repository.dart';
import 'package:order_app/features/details_of_product/data/repositories/get_product_details_repository.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/add_and_remove_from_cart_cubit.dart';
import 'package:order_app/features/details_of_product/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/favorite/data/datasource/favorite_remote_data_source.dart';
import 'package:order_app/features/favorite/data/repositories/favorite_products_repository.dart';
import 'package:order_app/features/favorite/presentation/cubit/favorite_products_cubit.dart';
import 'package:order_app/features/orders/data/datasource/order_confirmation_remote_data_source.dart';
import 'package:order_app/features/orders/data/datasource/order_delivared_remote_data_source.dart';
import 'package:order_app/features/orders/data/datasource/order_in_way_remote_data_source.dart';
import 'package:order_app/features/orders/data/datasource/restore_order_remote_data_source.dart';
import 'package:order_app/features/orders/data/repositoies/order_confirmation_repository.dart';
import 'package:order_app/features/orders/data/repositoies/order_delivared_repository.dart';
import 'package:order_app/features/orders/data/repositoies/order_in_way_repository.dart';
import 'package:order_app/features/orders/data/repositoies/restore_order_repository.dart';
import 'package:order_app/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:order_app/features/products/data/datasource/add_to_favorite_remote_data_source.dart';
import 'package:order_app/features/products/data/datasource/get_products_market_remote_data_source.dart';
import 'package:order_app/features/products/data/datasource/remove_from_favorite_remote_data_source.dart';
import 'package:order_app/features/products/data/repositories/add_to_favorite_repository.dart';
import 'package:order_app/features/products/data/repositories/get_products_markets_repository.dart';
import 'package:order_app/features/products/data/repositories/remove_from_favorite_repository.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/settings/data/datasource/me_remote_data_source.dart';
import 'package:order_app/features/settings/data/datasource/update_profile_remote_data_source.dart';
import 'package:order_app/features/settings/data/repositories/me_repository.dart';
import 'package:order_app/features/settings/data/repositories/update_profile_repository.dart';
import 'package:order_app/features/shops/data/datasource/markets_remote_data_source.dart';
import 'package:order_app/features/shops/data/datasource/search_markets_remote_data_source.dart';
import 'package:order_app/features/shops/data/repositories/markets_repository_impl.dart';
import 'package:order_app/features/shops/data/repositories/search_markets_repository.dart';
import 'package:order_app/features/shops/domain/usecases/get_markets.dart';
import 'package:order_app/features/login/data/datasource/login_remote_data_source.dart';
import 'package:order_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:order_app/features/login/domain/usecases/login.dart';
import 'package:order_app/features/logout/data/datasource/logout_remote_data_source.dart';
import 'package:order_app/features/logout/data/repositories/log_out_repository_impl.dart';
import 'package:order_app/features/orders/data/datasource/get_orders_remote_data_source.dart';
import 'package:order_app/features/orders/data/datasource/remove_order_remote_data_source.dart';
import 'package:order_app/features/orders/data/repositoies/get_orders_repository.dart';
import 'package:order_app/features/orders/data/repositoies/remove_order_repository.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/sign_up/data/datasources/sign_up_remote_data_source.dart';
import 'package:order_app/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:order_app/features/sign_up/domain/usecases/sign_up.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // signup

  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl<Dio>()));

  sl.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<SignUpRepositoryImpl>(() => SignUpRepositoryImpl(
      signUpRemoteDataSource: sl<SignUpRemoteDataSource>()));

  sl.registerLazySingleton<SignUp>(
      () => SignUp(signUpRepository: sl<SignUpRepositoryImpl>()));

  // login

  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<LoginRepositoryImpl>(() =>
      LoginRepositoryImpl(loginRemoteDataSource: sl<LoginRemoteDataSource>()));

  sl.registerLazySingleton<Login>(
      () => Login(loginRepository: sl<LoginRepositoryImpl>()));

  //logout

  sl.registerLazySingleton<LogOutRemoteDataSource>(
      () => LogOutRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<LogOutRepositoryImpl>(() => LogOutRepositoryImpl(
      logoutRemoteDataSource: sl<LogOutRemoteDataSource>()));

  // getMarket

  sl.registerLazySingleton<MarketsRemoteDataSource>(
      () => MarketsRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<MarketsRepositoryImpl>(() => MarketsRepositoryImpl(
      marketsRemoteDataSource: sl<MarketsRemoteDataSource>()));

  sl.registerLazySingleton<GetMarkets>(
      () => GetMarkets(marketRepository: sl<MarketsRepositoryImpl>()));


 sl.registerLazySingleton<SearchMarketsRemoteDataSource>(
      () => SearchMarketsRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<SearchMarketsRepository>(() => SearchMarketsRepository(
      searchMarketsRemoteDataSource: sl<SearchMarketsRemoteDataSource>()));



  //get product details
  sl.registerLazySingleton<GetProductDetailsRemoteDataSource>(
      () => GetProductDetailsRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<GetProductDetailsRepository>(() =>
      GetProductDetailsRepository(
          getProductDetailsRemoteDataSource:
              sl<GetProductDetailsRemoteDataSource>()));

  //get products market
  sl.registerLazySingleton<GetProductsMarketRemoteDataSource>(
      () => GetProductsMarketRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<GetProductsMarketsRepository>(() =>
      GetProductsMarketsRepository(
          getProductsMarketRemoteDataSource:
              sl<GetProductsMarketRemoteDataSource>()));

  // add to favorite
  sl.registerLazySingleton<AddToFavoriteRemoteDataSource>(
      () => AddToFavoriteRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<AddToFavoriteRepository>(() =>
      AddToFavoriteRepository(
          addToFavoriteRemoteDataSource:
              sl<AddToFavoriteRemoteDataSource>()));
  

  // remove from favorite
  sl.registerLazySingleton<RemoveFromFavoriteRemoteDataSource>(
      () => RemoveFromFavoriteRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<RemoveFromFavoriteRepository>(() =>
      RemoveFromFavoriteRepository(
          removeFromFavoriteRemoteDataSource:
              sl<RemoveFromFavoriteRemoteDataSource>()));

  //add to cart
  sl.registerLazySingleton<AddToCartRemoteDataSource>(
      () => AddToCartRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<AddToCartRepository>(() => AddToCartRepository(
      addToCartRemoteDataSource: sl<AddToCartRemoteDataSource>()));

  // get cart
  sl.registerLazySingleton<GetCartRemoteDataSource>(
      () => GetCartRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<GetCartRepository>(() => GetCartRepository(
      getCartRemoteDataSource: sl<GetCartRemoteDataSource>()));

  // order cart
  sl.registerLazySingleton<OrderCartRemoteDataSource>(
      () => OrderCartRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<OrderCartRepository>(() => OrderCartRepository(
      orderCartRemoteDataSource: sl<OrderCartRemoteDataSource>()));

//remove product from cart
  sl.registerLazySingleton<RemoveProductFromCartRemoteDataSource>(
      () => RemoveProductFromCartRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<RemoveProductFromCartRepository>(() =>
      RemoveProductFromCartRepository(
          removeProductFromCartRemoteDataSource:
              sl<RemoveProductFromCartRemoteDataSource>()));

// get order
  sl.registerLazySingleton<GetOrdersRemoteDataSource>(
      () => GetOrdersRemoteDataSource(api: sl<DioConsumer>()));
  sl.registerLazySingleton<GetOrdersRepository>(() => GetOrdersRepository(
      getOrdersRemoteDataSource: sl<GetOrdersRemoteDataSource>()));

  // remove order

  sl.registerLazySingleton<RemoveOrderRemoteDataSource>(
      () => RemoveOrderRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<RemoveOrderRepository>(() => RemoveOrderRepository(
      removeOrderRemoteDataSource: sl<RemoveOrderRemoteDataSource>()));

  sl.registerLazySingleton<RestoreOrderRemoteDataSource>(
      () => RestoreOrderRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<RestoreOrderRepository>(() => RestoreOrderRepository(
      restoreOrderRemoteDataSource: sl<RestoreOrderRemoteDataSource>()));
      

  // update profile
  sl.registerLazySingleton<UpdateProfileRemoteDataSource>(
      () => UpdateProfileRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<UpdateProfileRepository>(() =>
      UpdateProfileRepository(
          updateProfileRemoteDataSource: sl<UpdateProfileRemoteDataSource>()));

  // favorite products
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
      () => FavoriteRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<FavoriteProductsRepository>(() =>
      FavoriteProductsRepository(
          favoriteRemoteDataSource: sl<FavoriteRemoteDataSource>()));

  sl.registerFactory<OrdersCubit>(() => OrdersCubit());
  sl.registerFactory<FavoriteProductsCubit>(() => FavoriteProductsCubit());
  sl.registerFactory<AddAndRemoveFromCartCubit>(() => AddAndRemoveFromCartCubit(cartCubit: CartCubit()));
  sl.registerFactory<AdminCubit>(() => AdminCubit(MarketsCubit()));
  sl.registerFactory<GetProductsCubit>(() => GetProductsCubit(FavoriteProductsCubit()));
  sl.registerFactory<GetProductDetailsCubit>(() => GetProductDetailsCubit());

  // to user
  sl.registerLazySingleton<ToUserRemoteDataSource>(
      () => ToUserRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<ToUserRepository>(() =>
      ToUserRepository(toUserRemoteDataSource: sl<ToUserRemoteDataSource>()));

  // to admin
  sl.registerLazySingleton<ToAdminRemoteDataSource>(
      () => ToAdminRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<ToAdminRepository>(() => ToAdminRepository(
      toAdminRemoteDataSource: sl<ToAdminRemoteDataSource>()));

   // create market 

  sl.registerLazySingleton<CreateMarketRemoteDataSource>(
      () => CreateMarketRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<CreateMarketRepository>(() => CreateMarketRepository(
      createMarketRemoteDataSource: sl<CreateMarketRemoteDataSource>()));



  // update market
  sl.registerLazySingleton<UpdateMarketRemoteDataSource>(
      () => UpdateMarketRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<UpdateMarketRepository>(() => UpdateMarketRepository(
      updateMarketRemoteDataSource: sl<UpdateMarketRemoteDataSource>()));


  // delete market
  sl.registerLazySingleton<DeleteMarketRemoteDataSource>(
      () => DeleteMarketRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<DeleteMarketRepository>(() => DeleteMarketRepository(
      deleteMarketRemoteDataSource: sl<DeleteMarketRemoteDataSource>()));


  // create product
  sl.registerLazySingleton<CreateProductRemoteDataSource>(
      () => CreateProductRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<CreateProductRepository>(() => CreateProductRepository(
      createProductRemoteDataSource: sl<CreateProductRemoteDataSource>()));


  // update product
  sl.registerLazySingleton<UpdateProductRemoteDataSource>(
      () => UpdateProductRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<UpdateProductRepository>(() => UpdateProductRepository(
      updateProductRemoteDataSource: sl<UpdateProductRemoteDataSource>()));

  // remove product
  sl.registerLazySingleton<DeleteProductRemoteDataSource>(
      () => DeleteProductRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<DeleteProductRepository>(() => DeleteProductRepository(
      deleteProductRemoteDataSource: sl<DeleteProductRemoteDataSource>()));


  // admin resopnse
  sl.registerLazySingleton<AdminResponseRemoteDataSource>(
      () => AdminResponseRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<AdminResponseRepository>(() => AdminResponseRepository(
      adminResponseRemoteDataSource: sl<AdminResponseRemoteDataSource>()));


  sl.registerLazySingleton<MeRemoteDataSource>(
      () => MeRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<MeRepository>(() => MeRepository(
      meRemoteDataSource: sl<MeRemoteDataSource>()));

  sl.registerLazySingleton<OrderInWayRemoteDataSource>(
      () => OrderInWayRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<OrderInWayRepository>(() => OrderInWayRepository(
      orderInWayRemoteDataSource: sl<OrderInWayRemoteDataSource>()));







  // update order

  sl.registerLazySingleton<UpdateOrderRemoteDataSource>(
      () => UpdateOrderRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<UpdateOrderRepository>(() => UpdateOrderRepository(
      updateOrderRemoteDataSource: sl<UpdateOrderRemoteDataSource>()));

  sl.registerLazySingleton<OrderConfirmationRemoteDataSource>(
      () => OrderConfirmationRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<OrderConfirmationRepository>(() => OrderConfirmationRepository(
      orderConfirmationRemoteDataSource: sl<OrderConfirmationRemoteDataSource>()));

  sl.registerLazySingleton<OrderDelivaredRemoteDataSource>(
      () => OrderDelivaredRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<OrderDelivaredRepository>(() => OrderDelivaredRepository(
      orderDelivaredRemoteDataSource: sl<OrderDelivaredRemoteDataSource>()));


  sl.registerLazySingleton<AdminNotificationRemoteDataSource>(
      () => AdminNotificationRemoteDataSource(api: sl<DioConsumer>()));

  sl.registerLazySingleton<AdminNotificationRepository>(() => AdminNotificationRepository(
      adminNotificationRemoteDataSource: sl<AdminNotificationRemoteDataSource>()));
}
