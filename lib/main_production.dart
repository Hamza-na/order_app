import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/generated/l10n.dart';

void main() {
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.س
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
