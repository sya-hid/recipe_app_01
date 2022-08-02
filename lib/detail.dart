import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/models/ingredients.dart';
import 'package:recipe_app/models/product.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.product.image),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: black.withOpacity(0.5)),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    color: grey,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                    color: grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage(widget.product.user.image),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.user.name,
                                    maxLines: 1,
                                    style: roboto.copyWith(
                                        fontSize: 16, color: black)),
                                const SizedBox(height: 5),
                                Text('12 Recipes Shared',
                                    style: roboto.copyWith(
                                        fontSize: 12,
                                        color: black.withOpacity(0.6)))
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${widget.product.rate}',
                                    style: roboto.copyWith(fontSize: 12),
                                  ),
                                  const SizedBox(width: 5),
                                  RatingBar.builder(
                                      initialRating: widget.product.rate,
                                      itemSize: 14,
                                      allowHalfRating: true,
                                      unratedColor: grey.shade400,
                                      itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: orange.shade300),
                                      onRatingUpdate: (value) {})
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '(24 Reviews)',
                                style: roboto.copyWith(
                                    fontSize: 12,
                                    color: black.withOpacity(0.6)),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.name,
                                  style: roboto.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: black)),
                              const SizedBox(height: 5),
                              Text('1 Bowl (${widget.product.weight}g)',
                                  style: roboto.copyWith(
                                      fontSize: 12,
                                      color: black.withOpacity(0.6))),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            'See details',
                            style: roboto.copyWith(
                                color: green,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyCircular(
                            color: green,
                            header: 'Carbs',
                            footer: '${widget.product.carb} g',
                            footer_: '(56%)',
                            data: 0.4,
                          ),
                          MyCircular(
                            color: red,
                            header: 'Fat',
                            footer: '${widget.product.fat} g',
                            footer_: '(72%)',
                            data: 0.6,
                          ),
                          MyCircular(
                            color: orange,
                            header: 'Protein',
                            footer: '${widget.product.protein} g',
                            footer_: '(8%)',
                            data: 0.2,
                          ),
                          MyCircular(
                            color: green,
                            header: 'Calories',
                            footer: '${widget.product.calorie} kkal',
                            footer_: '',
                            data: 0.7,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            'Ingredients',
                            style: roboto.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                          const Spacer(),
                          Text(
                            'See details',
                            style: roboto.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: green),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            ingredients.length,
                            (index) => IngredientItem(
                                ingredients: ingredients[index])),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.55,
              child: ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(color: grey.shade200),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.5 + 20,
              right: 50,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset.zero,
                          spreadRadius: 7,
                          blurRadius: 0,
                          color: grey.shade300)
                    ],
                    color: widget.product.fav ? red : grey.shade300),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  final Ingredients ingredients;
  const IngredientItem({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: ingredients.color),
          child: Image.asset(ingredients.image),
        ),
        const SizedBox(height: 5),
        Text(
          ingredients.name,
          style: roboto.copyWith(fontSize: 12, color: black.withOpacity(0.6)),
        )
      ],
    );
  }
}

class MyCircular extends StatelessWidget {
  final String? header, footer, footer_;
  final Color color;
  final double data;
  const MyCircular({
    Key? key,
    required this.header,
    required this.footer,
    required this.footer_,
    required this.color,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      lineWidth: 7,
      reverse: true,
      animation: true,
      animationDuration: 500,
      restartAnimation: true,
      progressColor: color,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          header!,
          style: roboto.copyWith(color: black.withOpacity(0.6), fontSize: 12),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$footer ',
                style: roboto.copyWith(color: black, fontSize: 12)),
            TextSpan(
                text: footer_,
                style: roboto.copyWith(
                    color: color, fontWeight: FontWeight.bold, fontSize: 12)),
          ]),
        ),
      ),
    );
  }
}
