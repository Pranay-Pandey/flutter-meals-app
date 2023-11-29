import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        drawer: MainDrawer(selectScreen_: (identifier){
          Navigator.of(context).pop();
          if (identifier=='meals'){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return const TabsScreen();
            }));
          }
        },),
        body: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (newvalue) {
                setState(() {
                  _glutenFreeFilter = newvalue;
                });
              },
              title: Text(
                'Glutten Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include glutten free meals',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            )
          ],
        ));
  }
}
