import 'package:flutter/material.dart';
import 'package:meals/widgets/filter.dart';

enum FilterValues{
  gluttenFree, 
  lactoseFree,
  vegan, 
  vegetarian
}

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.initialFilters});

  Map<FilterValues, bool> initialFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  @override
  void initState() {
    _glutenFreeFilter = widget.initialFilters[FilterValues.gluttenFree]!;
    _lactoseFreeFilter = widget.initialFilters[FilterValues.lactoseFree]!;
    _vegetarianFilter = widget.initialFilters[FilterValues.vegetarian]!;
    _veganFilter = widget.initialFilters[FilterValues.vegan]!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: WillPopScope(
          onWillPop: () async{
            Navigator.of(context).pop(
              {
                FilterValues.gluttenFree: _glutenFreeFilter,
                FilterValues.lactoseFree: _lactoseFreeFilter,
                FilterValues.vegan: _veganFilter,
                FilterValues.vegetarian: _vegetarianFilter
              }
            );
            return false;
          },
          child: Column(
            children: [
              Filter(
                  title: 'Glutten Free',
                  subtitle: 'Only include glutten free meals',
                  variable: _glutenFreeFilter, 
                  changeFunction: (newValue){
                    setState(() {
                    _glutenFreeFilter = newValue;
                    });
                  },),
              Filter(
                  title: 'Lactose Free',
                  subtitle: 'Only include lactose free meals',
                  variable: _lactoseFreeFilter, 
                  changeFunction: (newValue){
                    setState(() {
                    _lactoseFreeFilter = newValue;
                    });
                  },),
              Filter(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  variable: _vegetarianFilter, 
                  changeFunction: (newValue){
                    setState(() {
                    _vegetarianFilter = newValue;
                    });
                  },),
              Filter(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  variable: _veganFilter, 
                  changeFunction: (newValue){
                    setState(() {
                    _veganFilter = newValue;
                    });
                  },),
            ],
          ),
        ));
  }
}
