import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.toogleFavorite});

  final Function(Meal meal) toogleFavorite;

  void _SelectCategory(BuildContext context, Category category) {
    final selectedCategories = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: selectedCategories,
              toogleFavorite: toogleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories.map((cat) {
          return CategoryView(
            category: cat,
            caller: () {
              _SelectCategory(context, cat);
            },
          );
        }).toList(),
    );
  }
}
