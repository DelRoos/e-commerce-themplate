import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionalWidth(14),
          width: getProportionalWidth(14),
        ),
        SizedBox(
          width: getProportionalWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
