import 'dart:developer';

import 'package:e_commerce/components/custom_surffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error_text.dart';
import 'package:e_commerce/components/social_card.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String confirmPassword = "";
  final List<String> errors = [];

  void addError(String error) {
    setState(() {
      errors.add(error);
    });
  }

  void removeError(String error) {
    setState(() {
      errors.remove(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            buildEmailField(),
            SizedBox(height: getProportionalHeight(30)),
            buildPasswordField(),
            SizedBox(height: getProportionalHeight(30)),
            buildConfirmPasswordField(),
            SizedBox(height: getProportionalHeight(20)),
            FormError(errors: errors),
            SizedBox(height: getProportionalHeight(20)),
            DefaultButton(
              text: "Confirm",
              press: () {
                if (_formkey.currentState!.validate()) {
                  // inspect(_formkey);
                  inspect(errors);
                }
              },
            ),
            SizedBox(height: getProportionalHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: getProportionalHeight(20)),
            Text(
              "By continuing your confirm that your agree \nwith our Term and Condition ",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      onSaved: (value) => confirmPassword = value!,
      obscureText: true,
      onChanged: (value) {
        print(value);
        if (value.isNotEmpty) {
          removeError(kPassNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(kMatchPassError);
          print(kMatchPassError);
          inspect(errors);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPassNullError);
          return "";
        } else if (password != value && !errors.contains(kMatchPassError)) {
          addError(kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Re-enter your password",
        labelText: "Confirm Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (value) => password = value!,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(kPassNullError);
          return null;
        } else if (!(value.length < 8) && errors.contains(kShortPassError)) {
          removeError(kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          addError(kPassNullError);
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          addError(kShortPassError);
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      onSaved: (value) => email = value!,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kEmailNullError)) {
          removeError(kEmailNullError);
          return null;
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          removeError(kInvalidEmailError);
        }
      },
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          addError(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          addError(kInvalidEmailError);
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
