import 'package:flutter/material.dart';

class Category {
  final String name, image;
  final Color color;

  Category({required this.name, required this.image, required this.color});
}

List<Category> categories = [
  Category(name: 'Oats', image: 'assets/oats.png', color: Colors.grey),
  Category(name: 'Cereals', image: 'assets/cereal.png', color: Colors.pink),
  Category(name: 'Fruits', image: 'assets/banana.png', color: Colors.blue),
  Category(name: 'Vegetable', image: 'assets/corn.png', color: Colors.orange),
  Category(
      name: 'Bread', image: 'assets/bread.png', color: Colors.brown.shade400),
];
