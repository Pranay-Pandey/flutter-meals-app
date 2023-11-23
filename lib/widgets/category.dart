import 'package:flutter/material.dart';
import 'package:meals/models/category.dart' as model;

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final model.Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        showModalBottomSheet(context: context, builder: (buil){
          return Container(
            height: 200,
            color: category.color,
            child: Center(child: Text(category.title),),
          );
        });
      },
      onHover: (val){
        
      },
      onTap: () {
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
