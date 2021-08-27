import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/components/profile_modal.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/textFields.dart';
import 'package:fridge/components/buttons.dart';
import 'package:fridge/components/foodTile.dart';
import 'package:fridge/components/menu_modal.dart';
import 'package:fridge/components/ingredient_modal.dart';
import 'package:fridge/components/fridge_modal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: height,
          width: width,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    modalMenu(context);
                                  },
                                  icon: FaIcon(FontAwesomeIcons.bars)),
                              IconButton(
                                  onPressed: () {
                                    profileModalMenu(context);
                                  },
                                  icon: FaIcon(FontAwesomeIcons.userCircle)),
                            ],
                          ),
                        ),
                        InsertTextFlied(width: width, text: 'Search'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Filter',
                            style: kText1,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: kRedColor),
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 15,
                                            offset: const Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.heart,
                                        color: kRedColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: kTileItemColor),
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 15,
                                            offset: const Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.shoppingBasket,
                                        color: kTileItemColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: kTileStarColor),
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 15,
                                            offset: const Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: FaIcon(
                                        FontAwesomeIcons.solidStar,
                                        color: kTileStarColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: kFieldTextColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 15,
                                              offset: const Offset(0, 10),
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Cal',
                                          style:
                                              TextStyle(color: kFieldTextColor,fontFamily: 'Poppins',),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Foods',
                                    style: kHeading2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleIconButton(
                                        icon: FontAwesomeIcons.shoppingBasket,
                                        onPressed: () {
                                          ingredientModal(context);
                                        },
                                        onColor: kRedColor,
                                      ),
                                      CircleIconButton(
                                        icon: FontAwesomeIcons.storeAlt,
                                        onPressed: () {
                                          fridgeModal(context);
                                        },
                                        onColor: kTileColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 7,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ListView(
                                  children: [
                                    FoodTile(
                                      title: 'Strawberry tart',
                                      image: 'asset/images/recipe_image.png',
                                      items: 6,
                                      allItems: 7,
                                      star: 4,
                                      cal: 377,
                                    ),
                                    FoodTile(
                                      title: 'test Tile',
                                      image: 'asset/images/recipe_image.png',
                                    ),
                                    FoodTile(
                                      title: 'test Tile',
                                      image: 'asset/images/recipe_image.png',
                                    ),
                                    FoodTile(
                                      title: 'test Tile',
                                      image: 'asset/images/recipe_image.png',
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
