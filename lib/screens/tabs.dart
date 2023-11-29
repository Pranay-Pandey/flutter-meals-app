import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;
  final List<Meal> favoriteMeals = [];

  void changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void toogleFavorite(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      favoriteMeals.remove(meal);
    } else {
      favoriteMeals.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    if (_selectedPage == 1) {
      screen = MealsScreen(
        title: 'Favorites',
        meals: favoriteMeals,
        toogleFavorite: toogleFavorite,
      );
    } else {
      screen = CategoriesScreen(toogleFavorite: toogleFavorite);
    }
    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
