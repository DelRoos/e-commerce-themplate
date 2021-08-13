import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.text,
    required this.press,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionalHeight(40),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionalWidth(30),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
