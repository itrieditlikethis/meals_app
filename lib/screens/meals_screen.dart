import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_preview.dart';

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
        itemBuilder: (ctx, index) => MealPreview(meal: mealsData[index]),
      );
    } else {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        body: content,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
