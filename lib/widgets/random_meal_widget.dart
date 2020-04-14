import 'package:flutter/material.dart';

import 'package:food_app/provider/food.dart';

import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'one_meal_widget.dart';

class RandomMealWidget extends StatefulWidget {
  RandomMealWidget({this.provider});
  final Food provider;

  @override
  _RandomMealWidgetState createState() => _RandomMealWidgetState();
}

class _RandomMealWidgetState extends State<RandomMealWidget> {
  List<dynamic> randomMeal;
  void loadData() async {
    await widget.provider.getRandom();
    randomMeal = widget.provider.randomMealResponseBody['meals'];
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String longString = "";
    String instructions = "";
    if (randomMeal != null) {
      for (int i = 1; i < 21; i++) {
        if (randomMeal[0]['strIngredient$i'].toString().isEmpty ||
            randomMeal[0]['strIngredient$i'] == null) break;
        longString +=
            "* ${randomMeal[0]['strIngredient$i']} (${randomMeal[0]['strMeasure$i']}).\n \n";
      }
      instructions = randomMeal[0]['strInstructions'];
      instructions = instructions.replaceAll('.', ". \n ");
    }

    return randomMeal == null
        ? Container(
            height: 400,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Center(
                    child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 100.0,
                  color: Colors.black,
                )),
              ],
            ),
          )
        : OneMealWidget(
            randomMeal: randomMeal,
            instructions: instructions,
            longString: longString);
  }
}
