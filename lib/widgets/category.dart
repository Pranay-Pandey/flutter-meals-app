import 'package:flutter/material.dart';
import 'package:meals/models/category.dart' as model;

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category, required this.caller});

  final model.Category category;
  final void Function() caller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (val){
        if (val){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(category.title),));}
      },
      onTap: caller,
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