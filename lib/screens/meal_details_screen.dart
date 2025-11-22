import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(meal.title, softWrap: true),
          actions: [
            IconButton(
              onPressed: () => onToggleFavorite(meal),
              icon: Icon(Icons.star),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl),
              const SizedBox(height: 10),
              _MealInstructions(
                mealInstructions: meal.ingredients,
                titleText: 'Ingredients',
              ),
              const SizedBox(height: 20),
              _MealInstructions(
                titleText: 'Steps',
                mealInstructions: meal.steps,
              ),
              SizedBox(height: 20),
              Wrap(
                runSpacing: 8,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  meal.isGlutenFree
                      ? const _IsDetails(text: 'Gluten-Free')
                      : const SizedBox.shrink(),
                  const SizedBox(width: 10),
                  meal.isLactoseFree
                      ? const _IsDetails(text: 'Lactose-Free')
                      : const SizedBox.shrink(),
                  const SizedBox(width: 10),
                  meal.isVegan
                      ? const _IsDetails(text: 'Vegan')
                      : const SizedBox.shrink(),
                  const SizedBox(width: 10),
                  meal.isVegetarian
                      ? const _IsDetails(text: 'Vegetarian')
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MealInstructions extends StatelessWidget {
  const _MealInstructions({
    required this.mealInstructions,
    required this.titleText,
  });

  final String titleText;
  final List<String> mealInstructions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          ...mealInstructions.map(
            (step) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 4.0,
              ),
              child: Text(
                step,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IsDetails extends StatelessWidget {
  const _IsDetails({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      label: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
      ),
    );
  }
}
