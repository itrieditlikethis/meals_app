import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_preview_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealPreview extends StatelessWidget {
  final Meal meal;

  const MealPreview({super.key, required this.meal});

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

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
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: screenHeight / 4,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: theme.colorScheme.surfaceContainer.withValues(
                  alpha: 0.4,
                ),
                child: Column(
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
                        MealPreviewTrait(
                          icon: Icons.timer_sharp,
                          label: meal.duration.toString(),
                        ),
                        MealPreviewTrait(
                          icon: Icons.account_balance_wallet_outlined,
                          label: affordabilityText,
                        ),
                        MealPreviewTrait(
                          icon: Icons.account_tree_outlined,
                          label: complexityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
