import 'package:e_commerce/components/custom_bottom_navbar.dart';
import 'package:e_commerce/enums.dart';
import 'package:e_commerce/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: ,)
      body: Body(),
      bottomNavigationBar: CustomButtonNavBar(selectedMenu: MenuState.home),
    );
  }
}
