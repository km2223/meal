import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummu_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/caregory_meal_screen.dart';
import 'package:flutter_complete_guide/screens/fliter_screen.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeal=DUMMY_MEALS;
  List<Meal>_favoriteMeal=[];

void _setFliterData(Map<String,bool>_FilterData){
  setState(() {
    _filters=_FilterData;
    _availableMeal=DUMMY_MEALS.where((meal) {
      if (_filters['gluten']&&!meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']&&!meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']&&!meal.isVegan) {
        return false;
      }
       if (_filters['vegetarian']&&!meal.isVegetarian) {
        return false;
      }
      return true;




    }
    ).toList();
  });

}
  void TaggleFavorite(String mealId){
    final existingIndex= _favoriteMeal.indexWhere((meal) => mealId==meal.id);
    if (existingIndex>=0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
      
    } else {
            setState(() {
              _favoriteMeal.add(
                DUMMY_MEALS.firstWhere((meal) => meal.id==mealId)
              );
      });
      
    }
    
  }
  bool _IsFavorite(String mealId){
    return _favoriteMeal.any((meal) => meal.id==mealId);
  }
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
        '/': (ctx) => TabsScreen(_favoriteMeal),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName:(ctx) => MealDetailScreen(TaggleFavorite, _IsFavorite),
        FilterScreen.routeName:(ctx) => FilterScreen(_filters,_setFliterData)
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
        
      },
    );
  }
}


