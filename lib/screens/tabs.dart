import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer.dart';

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

  void toastMessage(Widget message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message,
    ));
  }

  void changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void toogleFavorite(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      toastMessage(const Text('Removed from favorites'));
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      toastMessage(const Text('Added to favorites'));
    }
  }

  void selectScreen(String identifier){
    if (identifier=='filters'){
      Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) {
                  return const FilterScreen();
                },
              ),
            );
    }else{
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    String title = 'Meals';
    if (_selectedPage == 1) {
      screen = MealsScreen(
        meals: favoriteMeals,
        toogleFavorite: toogleFavorite,
      );
      title = 'Favorites';
    } else {
      screen = CategoriesScreen(toogleFavorite: toogleFavorite);
      title = 'Meals';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer:  MainDrawer(selectScreen_: selectScreen,),
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
