import 'package:e_commerce/screens/forget_password/components/body.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/forgotPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: getProportionalHeight(20),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
