import 'package:flutter/material.dart';

class Ingredients {
  final String name, image;
  final Color color;
  Ingredients({required this.color, required this.name, required this.image});
}

List<Ingredients> ingredients = [
  Ingredients(
      color: Colors.orange.shade200,
      name: 'Potato',
      image: 'assets/potato.png'),
  Ingredients(color: Colors.blue, name: 'onion', image: 'assets/onion.png'),
  Ingredients(
      color: Colors.deepOrange.shade200,
      name: 'Almond',
      image: 'assets/almond.png'),
  Ingredients(
      color: Colors.yellow, name: 'Broccoli', image: 'assets/broccoli.png'),
  Ingredients(color: Colors.grey, name: 'Ginger', image: 'assets/ginger.png'),
];
