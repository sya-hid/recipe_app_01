import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/home.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/spork.jpeg'), fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            color: grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Let\'s cook your own food\nand adjust your diet',
                    textAlign: TextAlign.center,
                    style: roboto.copyWith(
                        fontSize: 24, height: 1.5, color: black),
                  ),
                  Text(
                    'Don\'t be confused, Complete your nutritional\nneeds by choosing food here!',
                    textAlign: TextAlign.center,
                    style: roboto.copyWith(
                        color: black.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 2),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: green),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: poppins.copyWith(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
