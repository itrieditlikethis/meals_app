import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  DrawerFilter.glutenFree: false,
  DrawerFilter.lactoseFree: false,
  DrawerFilter.vegan: false,
  DrawerFilter.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favoriteMeals = [];
  Map<DrawerFilter, bool> _selectedFilters = kInitialFilters;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(seconds: 2), content: Text(message)));
  }

  void _setIsFavoriteMeal(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    isExisting
        ? setState(() {
            _favoriteMeals.remove(meal);
            _showInfoMessage('Meal removed from favorites');
          })
        : setState(() {
            _favoriteMeals.add(meal);
            _showInfoMessage('Meal added to favorites');
          });
  }

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final filtersResult = await Navigator.of(
        context,
      ).push<Map<DrawerFilter, bool>>(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));

      setState(() {
        _selectedFilters = filtersResult ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(selectedFilters: _selectedFilters, onToggleFavorite: _setIsFavoriteMeal);
    String activePageTitle = 'Categories';

    switch (_selectedPageIndex) {
      case 0:
        activePage = CategoriesScreen(selectedFilters: _selectedFilters, onToggleFavorite: _setIsFavoriteMeal);
        break;
      case 1:
        activePage = MealsScreen(mealsData: _favoriteMeals, onToggleFavorite: _setIsFavoriteMeal);
        activePageTitle = 'Favorites';
        break;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(activePageTitle)),
        drawer: MainDrawer(selectScreen: _selectScreen),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectPage(index),
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ),
      ),
    );
  }
}
