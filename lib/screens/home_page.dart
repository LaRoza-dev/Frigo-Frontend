import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/foodTile.dart';
import 'package:fridge/components/menu_modal.dart';
import 'package:fridge/components/ingredient_modal.dart';
import 'package:fridge/components/fridge_modal.dart';
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
      backgroundColor: Colors.deepPurple[50],
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Container(
                color: Colors.deepPurple[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'Foods',
                          style: kHeading2.copyWith(fontSize: 26),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Container(
                        width: width,
                        height: 50,
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
                                    color: Colors.grey.shade400),
                              ),
                              FaIcon(
                                FontAwesomeIcons.search,
                                color: Colors.grey.shade400,
                              )
                            ],
                          )),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
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
                                              DropdownMenuItem(
                                                  child: Text("data")),
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
                                          final recipe =
                                              _controller.recipes[index];
                                          return FoodTile(
                                            imageId: recipe.id,
                                            title: recipe.name,
                                            onPressed: () {
                                              openFoodModal(
                                                  context, recipe);
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
              Align(alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    border: Border.all(color: Colors.deepPurple.withOpacity(0.2)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.shoppingBasket,
                          color: Colors.deepPurple.withOpacity(0.5),
                        ),
                        onPressed: () {
                          ingredientModal(context);
                        },
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.storeAlt,
                          color: Colors.deepPurple.withOpacity(0.5),
                        ),
                        onPressed: () {
                          fridgeModal(context);
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            modalMenu(context);
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.userCircle,
                            color: Colors.deepPurple.withOpacity(0.5),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
