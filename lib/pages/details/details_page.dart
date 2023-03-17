
import 'package:flutter/material.dart';
import 'package:sniff_me/constants.dart';
import 'package:sniff_me/models/product.dart';
import 'package:sniff_me/pages/details/body.dart';
class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      title: const Text('Details'),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        const SizedBox(
          width: kDefaultPaddin / 2,
        ),
      ],
    );
  }
}
