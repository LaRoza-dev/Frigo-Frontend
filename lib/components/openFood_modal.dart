import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/models/recipe.dart';

Future<dynamic> openFoodModal(BuildContext context, RecipeModel recipe) {
  // SearchController searchController = Get.put(SearchController());

  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  List<Widget> ingredientItems(data) {
    List<Widget> list = [];
    for (var i = 0; i < data.length; i++) {
      list.add(
        IngredientItem(
          text: data[i],
        ),
      );
    }
    return list;
  }

  List<Widget> cookSteps(data) {
    List<Widget> list = [];
    for (var i = 0; i < data.length; i++) {
      list.add(
        CookStep(
          text: data[i],
          index: (i + 1).toString(),
        ),
      );
    }
    return list;
  }

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  child: FutureBuilder(
                    future: Get.put(DetaImage()).getImage(recipe.id),
                    builder: (BuildContext context, AsyncSnapshot<Widget> img) {
                      if (img.hasData) {
                        return img.requireData;
                      }
                      return Container(
                        width: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      // return img.requireData;
                    },
                  ),
                ),
                Positioned(
                  top: 25,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.solidTimesCircle,
                              color: Colors.grey,size: 30,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              color: kBackgroundColor,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            recipe.name,
                            style: kHeading2,
                            maxLines: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text("Rating"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FoodTag(
                                  text: '1:30 min',
                                  color: kButtonColor,
                                  textColor: Colors.white,
                                ),
                                FoodTag(text: 'Serving'),
                                FoodTag(text: 'Easy'),
                                FoodTag(text: 'Serving')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'A tried and tested recipe allowing you to make both the pizza dough and sauce completely from scratch',
                              style: ktext2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Ingredients',
                                style: kHeading2,
                              ),
                            ),
                          ),
                          Column(
                            children: ingredientItems(recipe.ingredients),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Receipe preparation',
                                style: kHeading2,
                              ),
                            ),
                          ),
                          Column(
                            children: cookSteps(recipe.cookSteps),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class FoodTag extends StatelessWidget {
  const FoodTag(
      {required this.text,
      this.color: Colors.white,
      this.textColor: ktext2Color});
  final String text;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Text(
          text,
          style: ktext2.copyWith(color: textColor),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kBorderColor),
        ));
  }
}

class IngredientItem extends StatelessWidget {
  const IngredientItem(
      {required this.text, this.icon = FontAwesomeIcons.circle});
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kTileColor.withOpacity(0.3)),
          color: kBackgroundColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                text,
                style: ktext2,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: FaIcon(
                icon,
                color: kTileColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CookStep extends StatelessWidget {
  const CookStep(
      {required this.text,
      this.icon = FontAwesomeIcons.circle,
      required this.index});
  final String text;
  final IconData? icon;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kTileColor.withOpacity(0.3)),
          color: kBackgroundColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 7),
              child: Container(
                alignment: Alignment.topLeft,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: kTileColor),
                child: Center(
                  child: Text(
                    index,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: AutoSizeText(
                text,
                style: ktext2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
