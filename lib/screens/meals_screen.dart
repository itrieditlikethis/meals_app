import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/specific_category_list_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.mealsData});

  final String title;

  final List<Meal> mealsData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Widget content;
    if (mealsData.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealsData.length,
        itemBuilder: (ctx, index) =>
            SpecificCategoryListItem(mealsData: mealsData, index: index),
      );
    } else {
      content = Center(child: Text('OOPS'));
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: content,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
