import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/screens/details/components/product_card_image.dart';
import 'package:e_commerce/screens/details/components/product_description.dart';
import 'package:e_commerce/screens/details/components/top_rounded_container.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImage(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionalWidth(20 * 2),
                  ),
                  child: Row(
                    children: [
                      ColorDot(product: product),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionalWidth(40 * 2),
      width: getProportionalWidth(40 * 2),
      decoration: BoxDecoration(
        // color: product.colors[0],
        shape: BoxShape.circle,
        border: Border.all(color: kPrimaryColor),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: product.colors[0],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
