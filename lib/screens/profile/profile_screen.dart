import 'package:e_commerce/components/custom_bottom_navbar.dart';
import 'package:e_commerce/enums.dart';
import 'package:e_commerce/screens/profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomButtonNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
