import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favoriteMeals = [];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setIsFavoriteMeal(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    isExisting
        ? setState(() {
            _favoriteMeals.remove(meal);
          })
        : setState(() {
            _favoriteMeals.add(meal);
          });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _setIsFavoriteMeal);
    String activePageTitle = 'Categories';

    switch (_selectedPageIndex) {
      case 0:
        activePage = CategoriesScreen(onToggleFavorite: _setIsFavoriteMeal);
        break;
      case 1:
        activePage = MealsScreen(
          mealsData: _favoriteMeals,
          onToggleFavorite: _setIsFavoriteMeal,
        );
        activePageTitle = 'Favorites';
        break;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(activePageTitle)),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectPage(index),
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ),
      ),
    );
  }
}
