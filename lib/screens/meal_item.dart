import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';

class MealItemScreen extends StatelessWidget {
  const MealItemScreen(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(children: [
        Image.network(
           meal.imageUrl,
          width: double.maxFinite,
          height: 300,
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}
