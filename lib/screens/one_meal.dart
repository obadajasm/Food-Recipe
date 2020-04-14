import 'package:flutter/material.dart';
import 'package:food_app/provider/food.dart';
import 'package:food_app/widgets/one_meal_detail.dart';
import 'package:provider/provider.dart';

class OneMealScreen extends StatefulWidget {
  OneMealScreen({this.provier});
  final Food provier;

  @override
  _OneMealScreenState createState() => _OneMealScreenState();
}

class _OneMealScreenState extends State<OneMealScreen> {
  @override
  Widget build(BuildContext context) {
    Food provider = Provider.of<Food>(context);
    return Scaffold(body: OneMealDetail(provider: provider));
  }
}
