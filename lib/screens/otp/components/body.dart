import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/otp/components/otp_verification_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionalWidth(20 * 2),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text(
                "We sent your code verification to +237 693 *** ***",
                textAlign: TextAlign.center,
              ),
              buildTimer(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.15,
              ),
              OTPForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend otp verification code",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("This code will expired in "),
        // TweenAnimationBuilder(
        //   tween: Tween(begin: 30.0, end: 0),
        //   duration: Duration(seconds: 30),
        //   builder: (context, value, child) => Text(
        //     "00:${int.parse(value.toString())}",
        //     style: TextStyle(color: kPrimaryColor),
        //   ),
        //   onEnd: () {},
        // ),
      ],
    );
  }
}
