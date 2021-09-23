import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:fridge/controllers/search_controller.dart';

Future<dynamic> fridgeModal(BuildContext context) {
  SearchController searchController = Get.put(SearchController());

  double height = MediaQuery.of(context).size.height;
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: double.infinity,
        height: height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fridge',
                      style: kHeading2,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.chevronDown,
                        color: kButtonColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ]),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: SearchField(
                    searchStyle: kText1,
                    controller: searchController.searchText,
                    searchInputDecoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.search,
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.timesCircle,
                              size: 20,
                            ),
                            onPressed: () {
                              searchController.searchText.clear();
                            }),
                        border: InputBorder.none),
                    suggestions: searchController.ingredients.toList(),
                    hint: 'Search Ingredients',
                    onTap: (value) {
                      searchController.basket.add(value.toString());
                      searchController.searchText.clear();
                    },
                    suggestionsDecoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8),
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    suggestionItemDecoration:
                        BoxDecoration(color: Colors.white),
                    suggestionStyle: ktext2,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: searchController.basket.length,
                      itemBuilder: (context, index) {
                        return ModalTile(
                          title: '${searchController.basket[index]}',
                          onPressed: () {},
                          crossOnPressed: () {
                            searchController.basket.removeAt(index);
                          },
                          heartOnPressed: () {},
                        );
                      },
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    ),
  );
}

class ModalTile extends StatelessWidget {
  ModalTile(
      {required this.title,
      required this.onPressed,
      this.trailWidget,
      required this.heartOnPressed,
      required this.crossOnPressed});

  final String title;
  final Function()? onPressed;
  final Function()? heartOnPressed;
  final Function()? crossOnPressed;
  final Widget? trailWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: onPressed,
            title: Text(
              title,
              style: kHeading3,
            ),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.heart,
                      color: kTextColor1,
                    ),
                    onPressed: heartOnPressed,
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.times,
                      color: kTextColor1,
                    ),
                    onPressed: crossOnPressed,
                  ),
                ],
              ),
            )),
        Divider(
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
