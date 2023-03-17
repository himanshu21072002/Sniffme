import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int size, id;
  final double price;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Cesar Gourmet Wet Dog Food Variety Packs – 24 Trays ",
    price: 20.99,
    size: 12,
    description: 'Contains one (1) 24 count case of 3.5 ounce easy peel trays of Cesar Wet Dog Food Poultry Variety Pack: (6) Duck Recipe, (6) Grilled Chicken Flavor, (6) Oven Roasted,Chicken Flavor, (6) Turkey Recipe',
    image: "assets/images/Untitled.png",
    color:  Colors.white,
  ),
  Product(
    id: 2,
    title: "PEDIGREE Complete Nutrition Adult Dry Dog Food Grilled Steak &amp",
    price: 39.99,
    size: 12,
    description: 'Contains one (1) PEDIGREE Complete Nutrition Adult Dry Dog Food Grilled Steak &amp; Vegetable Flavor Dog Kibble, 40 lb. Bag',
    image: "assets/images/Untitled1.png",
    color: Colors.white,
  ),
  Product(
    id: 3,
    title: "Meow Mix Original Choice Dry Cat Food",
    price: 20.99,
    size: 12,
    description: 'i).Contains (1) 22 Pound Bag of Dry Cat Food.\nii).Complete and balanced nutrition.\niii).Provides all essential vitamins and minerals.\niv).High quality protein helps support strong, healthy muscles',
    image: "assets/images/Untitled2.png",
    color: Colors.white,
  ),
  Product(
    id: 4,
    title: "Purina Fancy Feast Gravy Lovers Poultry &amp; Beef Feast Collection Wet Cat Food Variety Packs",
    price:20.99,
    size: 12,
    description: 'i).Twenty-Four (24) 3 oz. Cans - Purina Fancy Feast Gravy Wet Cat Food Variety Pack,Gravy Lovers Poultry &amp; Beef Feast Collection.\nii).Chicken. turkey and beef flavors cats love. 100 percent complete and balanced nutrition',
    image: "assets/images/Untitled3.png",
    color: Colors.white,
  ),
  Product(
    id: 5,
    title: "Cesar Gourmet Wet Dog Food Variety Packs – 24 Trays ",
    price: 20.99,
    size: 12,
    description: 'Contains one (1) 24 count case of 3.5 ounce easy peel trays of Cesar Wet Dog Food Poultry Variety Pack: (6) Duck Recipe, (6) Grilled Chicken Flavor, (6) Oven Roasted,Chicken Flavor, (6) Turkey Recipe',
    image: "assets/images/Untitled.png",
    color:  Colors.white,
  ),
  Product(
    id: 6,
    title: "PEDIGREE Complete Nutrition Adult Dry Dog Food Grilled Steak &amp",
    price: 39.99,
    size: 12,
    description: 'Contains one (1) PEDIGREE Complete Nutrition Adult Dry Dog Food Grilled Steak &amp; Vegetable Flavor Dog Kibble, 40 lb. Bag',
    image: "assets/images/Untitled1.png",
    color: Colors.white,
  ),
  Product(
    id: 7,
    title: "Meow Mix Original Choice Dry Cat Food",
    price: 20.99,
    size: 12,
    description: 'i).Contains (1) 22 Pound Bag of Dry Cat Food.\nii).Compleffte and balanced nutrition.\niii).Provides all essential vitamins and minerals.\niv).High quality protein helps support strong, healthy muscles',
    image: "assets/images/Untitled2.png",
    color: Colors.white,
  ),
  Product(
    id: 8,
    title: "Purina Fancy Feast Gravy Lovers Poultry &amp; Beef Feast Collection Wet Cat Food Variety Packs",
    price:20.99,
    size: 12,
    description: 'i).Twenty-Four (24) 3 oz. Cans - Purina Fancy Feast Gravy Wet Cat Food Variety Pack,Gravy Lovers Poultry &amp; Beef Feast Collection.\nii).Chicken. turkey and beef flavors cats love. 100 percent complete and balanced nutrition',
    image: "assets/images/Untitled3.png",
    color: Colors.white,
  ),
];
