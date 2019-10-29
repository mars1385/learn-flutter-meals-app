//import
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //props
  final String categoryId;
  final String categoryTitle;
  //cunstuctor
  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Text('Recipes'),
    );
  }
}
