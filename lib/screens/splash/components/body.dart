import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_in/sign_in.dart';
import 'package:e_commerce/screens/splash/components/splash_content.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.png",
      "text": "Welcome to Ultramerch, Let's shop"
    },
    {
      "image": "assets/images/splash_2.png",
      "text":
          "We help people connect with store. \narround United State of America"
    },
    {
      "image": "assets/images/splash_3.png",
      "text":
          "We help people connect with store \n arround United State of America"
    },
    {
      "image": "assets/images/splash_2.png",
      "text": "We show the easy way to shop.\n Just stay at home to us"
    },
  ];

  String setImage(String? image) =>
      (image == null) ? "assets/images/splash_2.png" : image;
  String setText(String? text) => (text == null)
      ? "We show the easy way to shop.\n Just stay at home to us"
      : text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: setImage(splashData[index]['image']),
                  text: setText(splashData[index]['text']),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(getProportionalWidth(20 * 2)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
