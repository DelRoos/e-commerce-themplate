import 'package:e_commerce/screens/forget_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_sreen.dart';
import 'package:e_commerce/screens/sign_in/sign_in.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
};
