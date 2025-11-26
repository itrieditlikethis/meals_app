import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  static void onChanged(bool value) {}
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Choose what to filter',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 10),
          SwitchListTile(
            value: _isGlutenFree,
            onChanged: (bool value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
            title: const Text('Gluten-free'),
          ),
          SwitchListTile(
            value: _isLactoseFree,
            onChanged: (bool value) {
              setState(() {
                _isLactoseFree = value;
              });
            },
            title: const Text('Lactose-free'),
          ),
          SwitchListTile(
            value: _isVegan,
            onChanged: (bool value) {
              setState(() {
                _isVegan = value;
              });
            },
            title: const Text('Vegan'),
          ),
          SwitchListTile(
            value: _isVegetarian,
            onChanged: (bool value) {
              setState(() {
                _isVegetarian = value;
              });
            },
            title: const Text('Vegetarian'),
          ),
        ],
      ),
    );
  }
}
