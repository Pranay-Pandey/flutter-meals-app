import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.selectScreen_});

  final void Function(String identifier) selectScreen_;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.fastfood,
                  size: 48, color: Theme.of(context).colorScheme.onPrimary),
              const SizedBox(width: 16),
              Text("Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            selectScreen_('meals');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            selectScreen_('filters');
          },
        ),
      ],
    ));
  }
}
