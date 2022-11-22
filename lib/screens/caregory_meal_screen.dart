
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummu_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';



class CategoryMealsScreen extends StatefulWidget {
/*   final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId,this.categoryTitle); */
  static const routeName='/categories-meals';


  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   String categoryTitle;
   List<Meal>_displayMeals;
   var _loadedData=false;


 

  void removeMeal(String mealId ){
    setState(() {
      
      _displayMeals.removeWhere((meal) => meal.id==mealId);
    });

  }
    @override
  void didChangeDependencies() {
    if(!_loadedData){
          final routArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
     categoryTitle=routArgs['title'];
    final categoryId=routArgs['id'];
     _displayMeals=DUMMY_MEALS.where(((meal) {
      return meal.categories.contains(categoryId);
      
    })).toList();
    _loadedData=true;

    }

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title:Text (categoryTitle),),
      body:ListView.builder(itemBuilder: ((context, index) {
        return  MealItem(
           id :_displayMeals[index].id,
           title:_displayMeals[index].title,
            ImageUrl:_displayMeals[index].imageUrl, 
            affordability:_displayMeals[index].affordability, 
            complexity:_displayMeals[index].complexity,
             duration:_displayMeals[index].duration,
             removeItem: removeMeal,
             );
      }),itemCount:_displayMeals.length,
      )
    ); 
  }
}