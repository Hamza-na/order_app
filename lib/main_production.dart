import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/routing/app_router.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/generated/l10n.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBIUZyMvWT0nv8FgFW8MQNZTNHdVo1ROjQ",
          authDomain: "order-app-3f867.firebaseapp.com",
          projectId: "order-app-3f867",
          messagingSenderId: "641515537666",
          appId: "1:641515537666:web:2758acc61da6d1c7a0ee1b",
          measurementId: "G-DMEBHFKTRY"
          )
     );
  await init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this. appRouter});

  

  // This widget is the root of your application.س
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      locale:const  Locale('en'),
      localizationsDelegates:const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.loginAdminScreen,
    );
  }
}
