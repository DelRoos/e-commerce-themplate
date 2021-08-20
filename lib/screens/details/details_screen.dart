import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/screens/details/components/body.dart';
import 'package:e_commerce/screens/details/components/customer_app_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomerAppBar(rating: arguments.product.rating),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}

class ProductDetailArguments {
  final Product product;

  ProductDetailArguments({required this.product});
}
