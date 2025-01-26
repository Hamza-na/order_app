import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:order_app/core/databases/cache/cache_helper.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/localization/cubit/local_cubit.dart';
import 'package:order_app/core/localization/cubit/local_state.dart';
import 'package:order_app/core/routing/app_router.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'order_app',
      options: const FirebaseOptions(
        apiKey: "AIzaSyBIUZyMvWT0nv8FgFW8MQNZTNHdVo1ROjQ",
        authDomain: "order-app-3f867.firebaseapp.com",
        projectId: "order-app-3f867",
        messagingSenderId: "641515537666",
        appId: "1:641515537666:web:2758acc61da6d1c7a0ee1b",
        measurementId: "G-DMEBHFKTRY",
      ),
    );
  }
  //await SharedPrefHelper.clearAllData();
  await init();
  final isLoggedIn = await isUserLoggedIn();
  

  runApp(MyApp(
    appRouter: AppRouter(),
    initialRoute: isLoggedIn ? Routes.entryPoint : Routes.loginScreen,
  ));
}

Future<bool> isUserLoggedIn() async {
  final accessToken = await SharedPrefHelper.getString("accessToken");
  final refreshToken = await SharedPrefHelper.getString("refreshToken");


  // Ensure all necessary tokens and expiry are available
   if (accessToken != null && accessToken.isNotEmpty && 
      refreshToken != null && refreshToken.isNotEmpty) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const MyApp({super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            locale: state.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: 'Order App',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
