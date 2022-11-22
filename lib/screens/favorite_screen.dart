import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
    return Center(child: Text(' you have no Favorite yet'),);

      
    }
    else{
      ListView.builder(itemBuilder: ((context, index) {
        return  MealItem(
           id :favoriteMeal[index].id,
           title:favoriteMeal[index].title,
            ImageUrl:favoriteMeal[index].imageUrl, 
            affordability:favoriteMeal[index].affordability, 
            complexity:favoriteMeal[index].complexity,
             duration:favoriteMeal[index].duration, 
             );
      }),itemCount:favoriteMeal.length,
      );
    }
  }
}