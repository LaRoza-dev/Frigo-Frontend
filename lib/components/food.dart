import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Frigo/constants.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:Frigo/components/foodTile.dart';
import 'package:Frigo/components/openFood_modal.dart';

class Food extends StatelessWidget {
  const Food({
    Key? key,
    required controller,
    required this.contentsController,
  })  : _controller = controller,
        super(key: key);

  final _controller;
  final contentsController;

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
                      () => Text(
                        "Showing ${_controller.totalNumber} foods",
                        style: kFormField.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(child: Text("data")),
                      ],
                      isDense: true,
                      hint: Text("Filters"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          contentsController.updateFindType('searchByIng');
                        },
                        child: Text('test'))
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
        ],
      ),
    );
  }
}
