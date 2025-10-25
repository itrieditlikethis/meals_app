import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredDummyMeals = dummyMeals
        .where((el) => el.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, mealsData: filteredDummyMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Pick your category')),
        body: GridView(
          padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: availableCategories
              .map(
                (item) => CategoryGridItem(
                  category: item,
                  onSelectCategory: () => _selectCategory(context, item),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
