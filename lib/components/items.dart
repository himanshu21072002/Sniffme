import 'package:flutter/material.dart';
import 'package:sniff_me/constants.dart';
import 'package:sniff_me/models/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({Key key,
    this.product,this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(kDefaultPaddin),

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ],
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image,
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
            child: Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kTextLightColor,
                fontSize: 15,
              ),
            ),
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}