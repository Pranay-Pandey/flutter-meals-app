import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';

class MealItemScreen extends StatelessWidget {
  const MealItemScreen(this.meal, {super.key, required this.toogleFavorite});

  final Meal meal;
  final Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => toogleFavorite(meal),
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            meal.imageUrl,
            width: double.maxFinite,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          const SizedBox(height: 24),
          Text(
            'Steps',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),
        ]),
      ),
    );
  }
}
