import 'package:e_commerce/components/custom_surffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error_text.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/forget_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_sreen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email, password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailMethod(),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          buildPasswordMethod(),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          DefaultButton(
              text: "Login",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.popAndPushNamed(
                      context, LoginSuccessScreen.routeName);
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildPasswordMethod() {
    return TextFormField(
      onSaved: (value) => password = value!,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
          return null;
        } else if (!(value.length < 8) && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
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

  TextFormField buildEmailMethod() {
    return TextFormField(
      onSaved: (value) => email = value!,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
          return null;
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
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
