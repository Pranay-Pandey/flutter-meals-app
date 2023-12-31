import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer.dart';

const Map<FilterValues, bool> kmealFilter={
  FilterValues.gluttenFree: false,
  FilterValues.lactoseFree: false,
  FilterValues.vegan: false,
  FilterValues.vegetarian: false
};

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
  Map<FilterValues, bool> mealFilter = kmealFilter;

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

  void selectScreen(String identifier) async{
    
    Navigator.of(context).pop();
    if (identifier=='filters'){

      final result = await Navigator.of(context).push<Map<FilterValues, bool>>(
              MaterialPageRoute(
                builder: (builder) {
                  return FilterScreen(initialFilters: mealFilter);
                },
              ),
            );

        setState(() {
          mealFilter = result ?? kmealFilter;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> allMeals = dummyMeals.where((element) {
      if (mealFilter[FilterValues.gluttenFree]! && !element.isGlutenFree){
        return false;
      }
      if (mealFilter[FilterValues.lactoseFree]! && !element.isLactoseFree){
        return false;
      }
      if (mealFilter[FilterValues.vegan]! && !element.isVegan){
        return false;
      }
      if (mealFilter[FilterValues.vegetarian]! && !element.isVegetarian){
        return false;
      }
      return true;
    }).toList();
    Widget screen;
    String title = 'Meals';
    if (_selectedPage == 1) {
      screen = MealsScreen(
        meals: favoriteMeals,
        toogleFavorite: toogleFavorite,

      );
      title = 'Favorites';
    } else {
      screen = CategoriesScreen(toogleFavorite: toogleFavorite, 
      allMeals: allMeals,);
      title = 'Meals';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(selectScreen_: selectScreen,),
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
