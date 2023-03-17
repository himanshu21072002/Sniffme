import 'package:flutter/material.dart';
import 'package:sniff_me/constants.dart';
import 'package:sniff_me/models/product.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: '${product.id}',
          child: Image.asset(product.image,
              height: size.height * 0.3, fit: BoxFit.cover),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(kDefaultPaddin,
                kDefaultPaddin * 2, kDefaultPaddin, kDefaultPaddin),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: kDefaultPaddin),
                  Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPaddin),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: kDefaultPaddin*8),
                  Center(
                    child: SizedBox(
                        width: 200,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text("Add to Cart"))),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
