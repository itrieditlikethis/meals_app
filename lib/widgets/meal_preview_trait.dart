import 'package:flutter/material.dart';

class MealPreviewTrait extends StatelessWidget {
  const MealPreviewTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 10,
      children: [
        Icon(icon, size: 16, color: theme.colorScheme.onSurface),
        Text(
          label,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.onSurface,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
