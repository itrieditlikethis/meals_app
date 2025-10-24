import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealPreview extends StatelessWidget {
  final Meal meal;

  const MealPreview({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 6,
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      color: theme.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          spacing: 15,
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image:
            NetworkImage(meal.imageUrl)),
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
