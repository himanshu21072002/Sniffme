import 'package:flutter/material.dart';
import 'package:sniff_me/constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Food", "Fashion", "Health", "Perfumes"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categories[index],
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
                  height: 2,
                  width: 40,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}