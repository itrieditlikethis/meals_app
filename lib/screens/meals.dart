import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.mealsData});

  final String title;

  final List<Meal> mealsData;

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (mealsData.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealsData.length,
        itemBuilder: (ctx, index) => Card(
          key: ValueKey(mealsData[index].title),
          child: Text(mealsData[index].title),
        ),
      );
    } else {
      content = Center(child: Text('OOPS'));
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
