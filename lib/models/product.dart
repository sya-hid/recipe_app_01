import 'package:recipe_app/models/users.dart';

class Product {
  final String image, name;
  final double rate, carb;
  final int calorie, fat, protein, weight;
  final bool fav;
  final User user;
  Product(
      {required this.user,
      required this.image,
      required this.name,
      required this.fav,
      required this.rate,
      required this.calorie,
      required this.fat,
      required this.weight,
      required this.protein,
      required this.carb});
}

List<Product> products = [
  Product(
      user: users[0],
      image: 'assets/shrimp-kale.jpg',
      name: 'Shrimp Kale',
      rate: 4,
      calorie: 300,
      weight: 300,
      fat: 30,
      protein: 15,
      fav: true,
      carb: 15),
  Product(
      user: users[0],
      image: 'assets/chicken-salad-with-tangy-lime-dressing.jpg',
      name: 'chicken Salad With Tangy Lime Dressing',
      rate: 4.3,
      weight: 250,
      calorie: 320,
      fav: false,
      fat: 30,
      protein: 15,
      carb: 15),
  Product(
      user: users[2],
      image: 'assets/chickpea-quinoa-salad.jpg',
      name: 'Chickpea Quinoa Salad',
      rate: 4.3,
      fav: true,
      weight: 200,
      calorie: 320,
      fat: 30,
      protein: 15,
      carb: 15),
  Product(
      user: users[0],
      image: 'assets/grilled-chicken-salad.jpg',
      name: 'Grilled Chicken Salad',
      rate: 5.0,
      fav: true,
      weight: 400,
      calorie: 420,
      fat: 40,
      protein: 35,
      carb: 15),
  Product(
      user: users[2],
      image: 'assets/mixed-salad.jpg',
      name: 'Mixed Salad',
      rate: 4.5,
      fav: false,
      weight: 200,
      calorie: 120,
      fat: 40,
      protein: 15,
      carb: 15),
];
