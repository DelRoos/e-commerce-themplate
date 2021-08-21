import 'package:e_commerce/routs.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      // initialRoute: ProfileScreen.routeName,
      routes: routes,
    );
  }
}
