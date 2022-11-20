import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 255, 1),
        fontFamily: 'Ralway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: TextStyle(
            color:Color.fromRGBO(255, 51, 51, 1)
            
          ),
          titleMedium:TextStyle(
            fontSize: 20,
             fontFamily: 'RobotoCondensed'

          )
        )
      ),
      home: CategoriesScreen(),
    );
  }
}


