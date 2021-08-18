import 'package:e_commerce/components/custom_surffix_icon.dart';
import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error_text.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/otp/otp_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

  void addError({required String error}) {
    setState(() {
      errors.add(error);
    });
  }

  void removeError({required String error}) {
    setState(() {
      errors.remove(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: getProportionalHeight(40),
          ),
          buildFirstNameField(),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          buildLastNameField(),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          buildPhoneNumberField(),
          SizedBox(
            height: getProportionalHeight(30),
          ),
          buildAddressField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionalHeight(40),
          ),
          DefaultButton(
            text: "Complete my profile ",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OTPScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      onSaved: (value) => firstName = value!,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kNamelNullError)) {
          removeError(error: kNamelNullError);
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNamelNullError)) {
          addError(error: kNamelNullError);
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your first name",
        labelText: "First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/User.svg',
        ),
      ),
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      onSaved: (value) => lastName = value!,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kNamelNullError)) {
          removeError(error: kNamelNullError);
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNamelNullError)) {
          addError(error: kNamelNullError);
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your last name",
        labelText: "Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/User.svg',
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (value) => phoneNumber = value!,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kPhoneNumberNullError)) {
          removeError(error: kPhoneNumberNullError);
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your phone number",
        labelText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/Phone.svg',
        ),
      ),
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      onSaved: (value) => address = value!,
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kAddressNullError)) {
          removeError(error: kAddressNullError);
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          addError(error: kAddressNullError);
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your address",
        labelText: "Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(
          svgIcon: 'assets/icons/Location point.svg',
        ),
      ),
    );
  }
}
