import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealPreview extends StatelessWidget {
  final Meal meal;

  // final int index;

  const MealPreview({
    super.key,
    required this.meal,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 6,
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      // key: ValueKey(mealsData[index].title),
      color: theme.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          spacing: 15,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: screenHeight / 4,
                width: double.infinity,
              ),
            ),
            Text(
              meal.title,
              style: theme.textTheme.headlineMedium!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      meal.duration.toString(),
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      meal.affordability.name,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.account_tree_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      meal.complexity.name,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
