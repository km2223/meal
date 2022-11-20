import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
    child: Scaffold(
      appBar:AppBar(title: Text('Meal!'),
      bottom:TabBar(
        tabs: [
          Tab(
            icon:Icon(Icons.category) ,
            text: 'Categories',
            ),
          Tab(
            icon:Icon(Icons.star) ,
            text: 'Favorite',
          )
        ],
      )),
      body:TabBarView(children: [
        CategoriesScreen(),
        FavoriteScreen()
      ]
      ),
    ),
    
    );
  }
}