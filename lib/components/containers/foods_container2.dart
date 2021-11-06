import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:get/get.dart';
import 'package:Frigo/components/foodTile.dart';
import 'package:Frigo/components/openFood_modal.dart';
import 'package:Frigo/controllers/recipe_controller2.dart';
import 'package:Frigo/controllers/pageContents_controller.dart';
import 'package:Frigo/constants.dart';
import 'package:Frigo/models/recipe.dart';

class FoodsContainer2 extends StatelessWidget {
  // const FoodsContainer({  });
  final RecipeController2 _controller =
      Get.put(RecipeController2(Get.find<RecipeRepository>()));
      final PageContentsController contentsController = Get.put(PageContentsController());
  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => FutureBuilder(
                        future: _controller.getTotalNumber(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Text(
                              "Loading ...",
                              style: kFormField.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            );
                          } else {
                            return Text(
                              "Showing ${snapshot.requireData} foods",
                              style: kFormField.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            );
                          }
                        },
                      ),
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(child: Text("data")),
                      ],
                      isDense: true,
                      hint: Text("Filters"),
                    ),
                    ElevatedButton(onPressed: () {contentsController.updateCondition('all');}, child: Text('test'))
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
                    print(recipe.name);
                    return FoodTile(
                      imageId: recipe.id,
                      title: recipe.name,
                      allItems: recipe.ingredients.length,
                      star: recipe.stars,
                      cal: recipe.nutritions["kcal"],
                      onPressed: () {
                        openFoodModal(context, recipe);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          // child: Obx(
          //   () => FutureBuilder(
          //     initialData: [],
          //     future: _controller.getAllRecipes(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState != ConnectionState.done) {
          //         return Center(child: CircularProgressIndicator());
          //       } else {
          //         var recipes = snapshot.requireData! as List;
          //         return ListView.builder(
          //           itemCount: recipes.length,
          //           itemBuilder: (context, index) {
          //             final recipe = recipes[index];
          //             print(recipe.name);
          //             return FoodTile(
          //               imageId: recipe.id,
          //               title: recipe.name,
          //               allItems: recipe.ingredients.length,
          //               star: recipe.stars,
          //               cal: recipe.nutritions["kcal"],
          //               onPressed: () {
          //                 openFoodModal(context, recipe);
          //               },
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
