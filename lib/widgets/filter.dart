import 'package:flutter/material.dart';

class Filter extends StatefulWidget{
  Filter({super.key, required this.title, required this.subtitle, required this.variable, required this.changeFunction});

  final String title;
  final String subtitle;
  bool variable;
  final Function(bool val) changeFunction;

  @override
  State<StatefulWidget> createState() {
    return _FilterState();
  }
}

class _FilterState extends State<Filter>{
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
          value: widget.variable,
          onChanged: widget.changeFunction,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            widget.subtitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        );
  }
}