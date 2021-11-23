import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Frigo/constants.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:Frigo/components/foodTile.dart';
import 'package:Frigo/components/openFood_modal.dart';
import 'package:flutter/cupertino.dart';

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
    List<String> sortItems = _controller.sortItems.keys.toList();
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
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        "Showing ${_controller.totalNumber} foods",
                        style: kFormField.copyWith(
                            fontSize: ScreenUtil().scaleText * 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          hint: Text(
                            _controller.sortItems[_controller.sort],
                            style: ktext2,
                          ),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 21,
                          underline: SizedBox(),
                          // isExpanded: true,

                          items: sortItems.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                _controller.sortItems[value],
                                style: ktext2,
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            _controller.changeSort(val);
                          },
                          // isDense: true,
                        ),
                      ),
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
                  itemBuilder: (context, index) {
                    final recipe = _controller.recipes[index];
                    if (index + 1 == _controller.recipes.length &&
                        index + 1 != _controller.totalNumber) {
                      return Center(
                          child: Container(
                        child: CircularProgressIndicator(),
                        height: 20,
                        width: 20,
                      ));
                    }
                    return FoodTile(
                      imageId: recipe.id,
                      title: recipe.name ?? '',
                      items: recipe.findedIngCount ?? 0,
                      allItems: recipe.ingredients.length ?? 0,
                      star: recipe.stars ?? 0,
                      cal: recipe.nutritions["kcal"] ?? '',
                      onPressed: () {
                        openFoodModal(
                            context, recipe, _controller.checkVisibility);
                      },
                    );
                  },
                  itemCount: _controller.recipes.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
