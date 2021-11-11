import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Frigo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Frigo/models/recipe.dart';
import 'package:Frigo/components/stars.dart';

Future<dynamic> openFoodModal(BuildContext context, RecipeModel recipe,bool checkisibility) {

  double width = MediaQuery.of(context).size.width;

  List<Widget> ingredientItems(data, indexList) {
    List<Widget> list = [];
    for (var i = 0; i < data.length; i++) {
      if (indexList.contains(i)) {
        list.add(
          IngredientItem(
            text: data[i],
            icon: FontAwesomeIcons.checkCircle,
            iconColor: Colors.green,
            checkVisibility: checkisibility,
          ),
        );
      } else {
        list.add(
          IngredientItem(
            text: data[i],
            checkVisibility: checkisibility,
          ),
        );
      }
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
                      if (img.connectionState != ConnectionState.done) {
                        return CircularProgressIndicator();
                      } else {
                        return img.requireData;
                      }
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
                              color: Colors.grey,
                              size: 30,
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
                            child: Row(
                              children: rating(recipe.stars),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    FoodTag(
                                      text: "Prep: ${recipe.prepTime}",
                                      color: kButtonColor,
                                      textColor: Colors.white,
                                    ),
                                    FoodTag(
                                      text: "Cook: ${recipe.cookTime}",
                                      color: kButtonColor,
                                      textColor: Colors.white,
                                    ),
                                    FoodTag(text: recipe.serves),
                                    FoodTag(text: recipe.skill),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Kcal: ${recipe.nutritions["kcal"]}",
                                        style: kNutrition,
                                      ),
                                      Text(
                                        "Fat: ${recipe.nutritions["fat"]}",
                                        style: kNutrition,
                                      ),
                                      Text(
                                        "Saturates: ${recipe.nutritions["saturates"]}",
                                        style: kNutrition,
                                      ),
                                      Text(
                                        "Carbs: ${recipe.nutritions["carbs"]}",
                                        style: kNutrition,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Sugars: ${recipe.nutritions["sugars"]}",
                                      style: kNutrition,
                                    ),
                                    Text(
                                      "Fibre: ${recipe.nutritions["fibre"]}",
                                      style: kNutrition,
                                    ),
                                    Text(
                                      "Protein: ${recipe.nutritions["protein"]}",
                                      style: kNutrition,
                                    ),
                                    Text(
                                      "Salt: ${recipe.nutritions["salt"]}",
                                      style: kNutrition,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              recipe.introduction,
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
                            children: ingredientItems(
                                recipe.ingredients, recipe.findedIngIndex),
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
        margin: EdgeInsets.all(5),
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
      {required this.text,
      this.icon = FontAwesomeIcons.circle,
      this.iconColor = kTileColor,
      this.checkVisibility=false});
  final String text;
  final IconData? icon;
  final Color iconColor;
  final bool checkVisibility;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: AutoSizeText(
                  text,
                  style: ktext2,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Visibility(visible: checkVisibility,
                child: FaIcon(
                  icon,
                  color: iconColor,
                ),
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
