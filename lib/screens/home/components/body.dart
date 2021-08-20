import 'package:e_commerce/screens/home/components/category.dart';
import 'package:e_commerce/screens/home/components/discount_banner.dart';
import 'package:e_commerce/screens/home/components/home_header.dart';
import 'package:e_commerce/screens/home/components/popular_products.dart';
import 'package:e_commerce/screens/home/components/special_offers.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: getProportionalWidth(20 * 2),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionalWidth(30 * 2),
            ),
            DiscountBanner(),
            SizedBox(
              height: getProportionalWidth(30 * 2),
            ),
            Categories(),
            SizedBox(
              height: getProportionalWidth(30 * 2),
            ),
            SpecialOffers(),
            SizedBox(
              height: getProportionalWidth(30 * 2),
            ),
            PopularProducts(),
          ],
        ),
      ),
    );
  }
}
