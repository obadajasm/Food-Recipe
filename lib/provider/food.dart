import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Food with ChangeNotifier {
  Map<String, dynamic> responseBody;
  Map<String, dynamic> randomMealResponseBody;
  Map<String, dynamic> byCategoryMealResponseBody;
  Map<String, dynamic> byIdyMealResponseBody;
  String selcetedCat;
  String selcetedMealId;

  bool isLoadeding = true;

  Future<void> getCategories() async {
    try {
      Response response = await Dio()
          .get("https://www.themealdb.com/api/json/v1/1/categories.php");
      responseBody = response.data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRandom() async {
    try {
      Response response =
          await Dio().get("https://www.themealdb.com/api/json/v1/1/random.php");
      randomMealResponseBody = response.data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void toogleIsLoaded() {
    isLoadeding = !isLoadeding;
    notifyListeners();
  }

  Future<void> getDataByCat(String category) async {
    try {
      Response response = await Dio().get(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");

      byCategoryMealResponseBody = response.data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDataById(String id) async {
    try {
      Response response = await Dio()
          .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");

      byIdyMealResponseBody = response.data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void setCatName(String s) {
    selcetedCat = s;
    notifyListeners();
  }

  void setMealid(String id) {
    selcetedMealId = id;
    notifyListeners();
  }
}
