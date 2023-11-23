import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart' as model;
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final model.Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        showModalBottomSheet(context: context, builder: (buil){
          return MealsScreen(title: category.title, meals: 
          dummyMeals.where((element) => element.categories.contains(category.id)).toList());
        });
      },
      onHover: (val){
        if (val){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(category.title),));
        }
      },
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MealsScreen(title: category.title, meals: 
          dummyMeals.where((element) => element.categories.contains(category.id)).toList())));
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.onBackground,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}


// Router for meals

Route<dynamic> mealsRoute(RouteSettings settings) {
  final args = settings.arguments as Map<String, dynamic>;
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MealsScreen(
      title: args['title'] as String,
      meals: args['meals'] as List<Meal>,
    ),
  );
}