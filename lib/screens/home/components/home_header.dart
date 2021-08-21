import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/home/components/icon_btn_with_counter.dart';
import 'package:e_commerce/screens/home/components/search_bar_field_component.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionalHeight(20 * 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SearchBarField(),
          IconBtnWithCounter(
            press: () => Navigator.pushNamed(context, CartScreen.routName),
            svgSrc: "assets/icons/Cart Icon.svg",
          ),
          IconBtnWithCounter(
            press: () {},
            svgSrc: "assets/icons/Bell.svg",
            numOfItem: 3,
          ),
        ],
      ),
    );
  }
}
