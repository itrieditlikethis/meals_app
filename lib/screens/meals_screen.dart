import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

import '../widgets/meal_preview.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.mealsData,
    required this.onToggleFavorite,
  });

  final void Function(Meal meal) onToggleFavorite;

  final String? title;

  final List<Meal> mealsData;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealDetailsScreen(
            meal: meal,
            onToggleFavorite: onToggleFavorite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Widget content;
    if (mealsData.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: mealsData.length,
        itemBuilder: (ctx, index) {
          final currentMeal = mealsData[index];
          return MealPreview(
            meal: currentMeal,
            onSelectMeal: () => _selectMeal(context, currentMeal),
          );
        },
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

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: theme.textTheme.headlineLarge!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      body: content,
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}
