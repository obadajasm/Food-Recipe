import 'package:flutter/material.dart';
import 'package:food_app/provider/food.dart';
import 'package:provider/provider.dart';

import 'one_meal_widget.dart';

class OneMealDetail extends StatefulWidget {
  OneMealDetail({this.provider});
  final Food provider;
  @override
  _OneMealDetailState createState() => _OneMealDetailState();
}

class _OneMealDetailState extends State<OneMealDetail> {
  String longString = "";
  String instructions = "";
  List<dynamic> data;
  void loadData() async {
    await widget.provider.getDataById(widget.provider.selcetedMealId);
    data = widget.provider.byIdyMealResponseBody['meals'];
    print(data);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      for (int i = 1; i < 21; i++) {
        if (data[0]['strIngredient$i'] == '') break;
        longString +=
            "* ${data[0]['strIngredient$i']} (${data[0]['strMeasure$i']}).\n \n";
      }
      instructions = data[0]['strInstructions'];
      instructions = instructions.replaceAll('.', ". \n ");
    }
    print("dassta" + data.toString());
    return data == null
        ? Container()
        : OneMealWidget(
            randomMeal: data,
            instructions: instructions,
            longString: longString,
          );
  }
}
