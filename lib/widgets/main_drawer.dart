import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withAlpha(100),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              spacing: 20,
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                Text(
                  'Coocing Up!',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          _DrawerListTile(tileIcon: Icons.restaurant, tileTitle: 'Meals'),
          _DrawerListTile(tileIcon: Icons.settings, tileTitle: 'Filters'),
        ],
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({required this.tileIcon, required this.tileTitle});

  final IconData tileIcon;
  final String tileTitle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      leading: Icon(tileIcon, size: 26, color: theme.colorScheme.primaryFixed),
      title: Text(
        tileTitle,
        style: theme.textTheme.titleSmall!.copyWith(
          color: theme.colorScheme.primary,
          fontSize: 24,
        ),
      ),
      onTap: () {},
    );
  }
}
