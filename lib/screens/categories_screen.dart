import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/category_item.dart';
import 'package:flutter_complete_guide/dummu_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:  const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id,e.title,e.color.toString())).toList(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20
      ),
    
    ) ;
  }
}