import 'package:flutter/material.dart';
import 'package:food_app/provider/food.dart';
import 'package:food_app/widgets/categor.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    Food myProvider = Provider.of<Food>(context);
    return Scaffold(
        body: Categot(
      provider: myProvider,
    ));
  }
}
