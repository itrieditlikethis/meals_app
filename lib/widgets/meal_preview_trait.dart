import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealPreviewTrait extends StatelessWidget{
  const MealPreviewTrait({super.key, required this.meal, });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 10,
      children: [
        Text(
          meal.title,
          style: theme.textTheme.headlineMedium!.copyWith(
            color: theme.colorScheme.onSurface,
            fontSize: 20,
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
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
    );
  }
}