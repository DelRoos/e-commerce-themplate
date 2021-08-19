import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/home/components/icon_btn_with_counter.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: getProportionalWidth(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionalHeight(20 * 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth * 0.5,
                    height: 50,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search product",
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(20),
                          vertical: getProportionalWidth(10 * 2),
                        ),
                      ),
                    ),
                  ),
                  IconBtnWithCounter(
                    press: () {},
                    svgSrc: "assets/icons/Cart Icon.svg",
                  ),
                  IconBtnWithCounter(
                    press: () {},
                    svgSrc: "assets/icons/Bell.svg",
                    numOfItem: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
