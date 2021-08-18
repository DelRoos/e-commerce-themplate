import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/complete_profile_screen/components/complete_profile_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(40)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Complete Profile",
                style: headingStyle,
              ),
              Text(
                "Complete your detail or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              CompleteProfileScreen(),
              SizedBox(
                height: getProportionalHeight(30),
              ),
              Text(
                "By continuing your confirm that your agree\nwith ours Term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
