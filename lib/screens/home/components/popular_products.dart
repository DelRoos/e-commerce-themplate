import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/screens/details/details_screen.dart';
import 'package:e_commerce/screens/home/components/section_title.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Popular product", press: () {}),
        SizedBox(
          height: getProportionalWidth(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailScreen.routeName,
                      arguments:
                          ProductDetailArguments(product: demoProducts[index])),
                ),
              ),
              SizedBox(
                height: getProportionalWidth(20 * 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
