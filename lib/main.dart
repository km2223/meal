import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/caregory_meal_screen.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
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
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber)
      ),
    // home: CategoriesScreen(),
 initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName:(ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
        
      },
    );
  }
}


