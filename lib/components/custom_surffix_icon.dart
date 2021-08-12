import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffix extends StatelessWidget {
  const CustomSuffix({
    required this.svgIcon,
    Key? key,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionalWidth(20),
        getProportionalWidth(40),
        getProportionalWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionalWidth(18),
      ),
    );
  }
}
