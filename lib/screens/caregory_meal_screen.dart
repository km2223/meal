
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummu_data.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';



class CategoryMealsScreen extends StatelessWidget {
/*   final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId,this.categoryTitle); */
  static const routeName='/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle=routArgs['title'];
    final categoryId=routArgs['id'];
    final categoryMeals=DUMMY_MEALS.where(((meal) {
      return meal.categories.contains(categoryId);
      
    })).toList();

    return Scaffold(
      appBar: AppBar(title:Text (categoryTitle),),
      body:ListView.builder(itemBuilder: ((context, index) {
        return  MealItem( id :categoryMeals[index].id,title:categoryMeals[index].title, ImageUrl:categoryMeals[index].imageUrl, affordability:categoryMeals[index].affordability, complexity:categoryMeals[index].complexity, duration:categoryMeals[index].duration);
      }),itemCount: categoryMeals.length,
      )
    ); 
  }
}