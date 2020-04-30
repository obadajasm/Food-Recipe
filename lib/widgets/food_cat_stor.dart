import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/provider/food.dart';
import 'package:food_app/screens/category_meals.dart';

class FoodCatStory extends StatefulWidget {
  const FoodCatStory({
    Key key,
    @required this.foodProvider,
  }) : super(key: key);

  final Food foodProvider;

  @override
  _FoodCatStoryState createState() => _FoodCatStoryState();
}

class _FoodCatStoryState extends State<FoodCatStory> {
  Map<String, dynamic> categorieList;
  void loadData() async {
    await widget.foodProvider.getCategories();
    widget.foodProvider.toogleIsLoaded();
    categorieList = widget.foodProvider.responseBody;
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        categorieList == null
            ? Container()
            : Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: categorieList['categories'].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.foodProvider.setCatName(
                                categorieList['categories'][index]
                                    ['strCategory']);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CategoryMealsScreen()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: Container(
                              width: 200,
                              height: 120,
                              // child: FadeInImage(
                              //   placeholder:
                              //       AssetImage('assets/images/loading.gif'),
                              //   width: 200,
                              //   height: 120,
                              //   fit: BoxFit.contain,
                              //   image: NetworkImage(
                              //     categorieList['categories'][index]
                              //         ['strCategoryThumb'],
                              //   ),
                              // ),
                              //child: Cached*Ima,
                              child: CachedNetworkImage(
                                imageUrl: categorieList['categories'][index]
                                    ['strCategoryThumb'],
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.black,
                                )),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          categorieList['categories'][index]['strCategory'],
                          style: TextStyle(letterSpacing: 2),
                        )
                      ],
                    );
                  },
                ),
              ),
      ],
    );
  }
}
