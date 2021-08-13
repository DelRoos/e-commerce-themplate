import 'package:e_commerce/components/custom_surffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error_text.dart';
import 'package:e_commerce/components/no_account_text.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionalHeight(30),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text(
                "Forgot password",
                style: TextStyle(
                  fontSize: getProportionalWidth(28 * 2),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "please enter your email and we will send \n you a link to return to our account.",
                textAlign: TextAlign.center,
              ),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.12,
          ),
          TextFormField(
            onSaved: (value) => email = value!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
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
                return null;
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
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
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          DefaultButton(
            text: "Reset password",
            press: () {
              if (_formKey.currentState!.validate()) {
                // print("valid formulaire");
              }
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          NoAccount(),
        ],
      ),
    );
  }
}
