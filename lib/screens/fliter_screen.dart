import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
class FilterScreen extends StatefulWidget {
  static const routeName='/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favorite"),
        
      ),
      drawer: MainDrawer(),
      body: Center(child: Text('filter'),),
    );
  }
}