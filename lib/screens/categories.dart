import 'package:flutter/material.dart';
import 'package:meals/data/dummy_categories.dart';
import 'package:meals/widgets/category.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: CategoryList.categories.map((cat) {
          return CategoryView(category: cat,);
        }).toList()
        ,
      ),
    );
  }
}
