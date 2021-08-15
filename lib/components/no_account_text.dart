import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/forget_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/sign_up_screen/sign_up_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account ?",
          style: TextStyle(
            fontSize: getProportionalWidth(16 * 2),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: getProportionalWidth(16 * 2),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
