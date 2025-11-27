import 'package:flutter/material.dart';

enum DrawerFilter { glutenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // TODO: implement filters naming with enums
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  void _onChanged({bool? isChecked, String? filterTitle}) {
    setState(() {
      switch (filterTitle) {
        case 'Gluten-free':
          _isGlutenFree = isChecked ?? false;
          break;
        case 'Lactose-free':
          _isLactoseFree = isChecked ?? false;
          break;
        case 'Vegan':
          _isVegan = isChecked ?? false;
          break;
        case 'Vegetarian':
          _isVegetarian = isChecked ?? false;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 10),
          _FilterSwitch(
            title: 'Gluten-free',
            value: _isGlutenFree,
            onChanged: _onChanged,
          ),
          _FilterSwitch(
            title: 'Lactose-free',
            value: _isLactoseFree,
            onChanged: _onChanged,
          ),
          _FilterSwitch(title: 'Vegan', value: _isVegan, onChanged: _onChanged),
          _FilterSwitch(
            title: 'Vegetarian',
            value: _isVegetarian,
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }
}

class _FilterSwitch extends StatelessWidget {
  const _FilterSwitch({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final void Function({bool isChecked, String filterTitle}) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (bool isChecked) =>
          onChanged(isChecked: isChecked, filterTitle: title),
    );
  }
}
