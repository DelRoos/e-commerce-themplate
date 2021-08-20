import 'package:e_commerce/components/rounded_button.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomerAppBar({Key? key, required this.rating})
      : preferredSize = Size.fromHeight(AppBar().preferredSize.height),
        super(key: key);
  final double rating;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalHeight(15 * 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedButton(
              iconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14 * 2,
                vertical: 5 * 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14 * 2),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5 * 2,
                  ),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
