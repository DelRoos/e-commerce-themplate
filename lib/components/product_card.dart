import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140 * 2,
    this.aspectRatio = 1.02,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionalWidth(20 * 2),
      ),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionalWidth(width),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionalWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.title,
                style: TextStyle(
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getProportionalWidth(18 * 2),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: EdgeInsets.all(getProportionalWidth(8 * 1.8)),
                      width: getProportionalWidth(28 * 2),
                      height: getProportionalWidth(28 * 2),
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.5)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
