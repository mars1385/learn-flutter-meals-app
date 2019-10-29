//import
import 'package:flutter/material.dart';

class Category {
  //props
  final String id;
  final String title;
  final Color color;

  //cunstructor
  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
