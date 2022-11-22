import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/favorite_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>_favoriteMeal;
TabsScreen(this._favoriteMeal );
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(widget._favoriteMeal),
      'title': 'Your Favorite',
    },
  ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        
        // type: BottomNavigationBarType.fixed,
        items: [
          
          BottomNavigationBarItem(
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
          
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}