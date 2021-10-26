import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/foodTile.dart';
import 'package:fridge/components/menu_modal.dart';
import 'package:fridge/components/ingredient_modal.dart';
import 'package:fridge/components/fridge_modal.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fridge/controllers/recipe_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:fridge/components/openFood_modal.dart';

class HomePage extends StatelessWidget {
  final RecipeController _controller = Get.put(RecipeController(Get.find()));
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: kPrimaryColor2,
        color: Color.fromRGBO(246, 230, 255, 1),
        items: <Widget>[
          FaIcon(
            FontAwesomeIcons.home,
            color: kPrimaryColor,
          ),
          FaIcon(
            FontAwesomeIcons.storeAlt,
            color: kPrimaryColor,
          ),
          FaIcon(
            FontAwesomeIcons.shoppingBasket,
            color: kPrimaryColor,
          ),
          FaIcon(
            FontAwesomeIcons.userCircle,
            color: kPrimaryColor,
          )
        ],
        onTap: (index) {
          if (index == 0) {
            //   ingredientModal(context);
            // } else if (index == 1) {
            //   fridgeModal(context);
            // } else if (index == 2) {
            //   modalMenu(context);
          }
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kPrimaryColor, kPrimaryColor2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Container(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Foods',
                        style: kHeading2.copyWith(
                            fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    width: width,
                    height: 35,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search here",
                              style: kFormField.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            FaIcon(
                              FontAwesomeIcons.search,
                              color: Colors.white.withOpacity(0.7),
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 20,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            )),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Showing ... foods",
                                        style: kFormField.copyWith(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      DropdownButton(
                                        items: [
                                          DropdownMenuItem(child: Text("data")),
                                        ],
                                        isDense: true,
                                        hint: Text("Filters"),
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 15,
                              child: Obx(
                                () => LazyLoadScrollView(
                                  onEndOfPage: _controller.loadNextPage,
                                  isLoading: _controller.lastPage,
                                  child: ListView.builder(
                                    itemCount: _controller.recipes.length,
                                    itemBuilder: (context, index) {
                                      final recipe = _controller.recipes[index];
                                      return FoodTile(
                                        imageId: recipe.id,
                                        title: recipe.name,
                                        star: recipe.stars,
                                        onPressed: () {
                                          openFoodModal(context, recipe);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
