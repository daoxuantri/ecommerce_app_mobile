import 'package:ecommerce_app_mobile/routes.dart';
import 'package:ecommerce_app_mobile/screens/splash/splash_screen.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:ecommerce_app_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Ecommerce Electronics',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
        
    );
  }
}

