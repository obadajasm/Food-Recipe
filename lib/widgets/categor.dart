import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/provider/food.dart';
import 'package:food_app/screens/one_meal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Categot extends StatefulWidget {
  const Categot({this.provider, this.catName});
  final Food provider;
  final String catName;

  @override
  _CategotState createState() => _CategotState();
}

class _CategotState extends State<Categot> {
  Map<String, dynamic> catData;
  void loadData() async {
    await widget.provider.getDataByCat(widget.provider.selcetedCat);
    catData = widget.provider.byCategoryMealResponseBody;
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Food provider = Provider.of<Food>(context);
    return catData == null
        ? Container()
        : ListView.builder(
            itemCount: catData['meals'].length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  widget.provider.setMealid(catData['meals'][index]['idMeal']);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OneMealScreen(provier: provider)));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 500,
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(64),
                        // child: FadeInImage(
                        //   width: 300,
                        //   height: 300,
                        //   placeholder: AssetImage('assets/images/loading.gif'),
                        //   image: NetworkImage(
                        //       catData['meals'][index]['strMealThumb']),
                        // ),
                        child: CachedNetworkImage(
                          imageUrl: catData['meals'][index]['strMealThumb'],
                          width: 300,
                          height: 300,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          )),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        catData['meals'][index]['strMeal'],
                        style: GoogleFonts.adamina(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
