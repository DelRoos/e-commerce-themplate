import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_up_screen/components/sign_up_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionalHeight(20)),
        child: Column(children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Text(
            "Register Account",
            style: headingStyle,
          ),
          Text(
            "Complete your details or continue \n with social media",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          SignUpForm(),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
        ]),
      ),
    );
  }
}
