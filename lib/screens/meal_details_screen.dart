import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(meal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl),
              const SizedBox(height: 10),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              ...meal.ingredients.map(
                (ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 4.0,
                  ),
                  child: Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              ...meal.steps.map(
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

class _IsDetails extends StatelessWidget {
  final String text;

  const _IsDetails({required this.text});

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
