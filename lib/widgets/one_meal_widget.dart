import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/animation/fadeanimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class OneMealWidget extends StatelessWidget {
  const OneMealWidget({
    Key key,
    @required this.randomMeal,
    @required this.instructions,
    @required this.longString,
  }) : super(key: key);

  final List<dynamic> randomMeal;
  final String instructions;
  final String longString;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: Divider(
                height: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "${randomMeal[0]['strMeal']}",
                  style: GoogleFonts.yeonSung(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.category),
                Text(
                  "${randomMeal[0]['strCategory']}",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.language),
                Text(
                  "${randomMeal[0]['strArea']}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(64),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage("${randomMeal[0]['strMealThumb']}"),
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
              4,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: AutoSizeText(
                      "Instructions : ",
                      style: GoogleFonts.b612Mono(fontSize: 30),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$instructions",
                      style: TextStyle(letterSpacing: 2, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              child: Divider(
                height: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            randomMeal[0]['strYoutube'] != null
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Learn how to do it on youtube   ",
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String ytLik = randomMeal[0]['strYoutube'];

                            await launch('$ytLik');
                          },
                          child: Image.asset(
                            "assets/images/youtube.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(height: 20),
            Text(
              "Ingredient : ",
              style: GoogleFonts.balooThambi(fontSize: 25),
            ),
            SizedBox(height: 20),
            AutoSizeText(
              longString,
              style: TextStyle(fontSize: 15, letterSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}
