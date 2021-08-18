import 'package:e_commerce/screens/otp/components/body.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  }
}
