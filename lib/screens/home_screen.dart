import 'package:flutter/material.dart';
import 'package:food_app/provider/food.dart';
import 'package:food_app/widgets/food_cat_stor.dart';
import 'package:food_app/widgets/random_meal_widget.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Food foodProvider = Provider.of<Food>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FoodCatStory(foodProvider: foodProvider),
              RandomMealWidget(provider: foodProvider),
            ],
          ),
        ),
      ),
    );
  }
}
