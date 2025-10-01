import 'package:flutter/material.dart';

import '../models/meal.dart';

class SpecificCategoryListItem extends StatelessWidget {
  final List<Meal> mealsData;

  final int index;

  const SpecificCategoryListItem({
    super.key,
    required this.mealsData,
    required this.index,
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: Image.network(
              mealsData[index].imageUrl,
              fit: BoxFit.cover,
              height: screenHeight / 4,
              width: double.infinity,
            ),
          ),
          Text(
            mealsData[index].title,
            style: theme.textTheme.headlineMedium!.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
