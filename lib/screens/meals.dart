import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.toogleFavorite});

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) toogleFavorite;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Uh! No, nothing to see here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try Selecting some different category',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) => MealItem(meal: meals[index], 
        toogleFavorite: toogleFavorite),
        itemCount: meals.length,
      );
    }

    if (title==null){
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
