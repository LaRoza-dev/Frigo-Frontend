import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:fridge/controllers/search_controller.dart';

Future<dynamic> ingredientModal(BuildContext context) {
  SearchController sc = Get.put(SearchController());

  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 1,
        builder: (_, controller) => Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ingredients',
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
                () => SearchField(
                  controller: sc.searchText,
                  searchInputDecoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.search),
                    suffixIcon: IconButton(
                      icon: Icon(FontAwesomeIcons.timesCircle),
                      onPressed: () {
                        sc.searchText.clear();
                      },
                    ),
                  ),
                  suggestions: sc.test.toList(),
                  hint: 'Search Ingredients',
                  onTap: (value) {
                    sc.favorite.add(value.toString());
                    sc.searchText.clear();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sc.favorite.length,
                    itemBuilder: (context, index) {
                      return ModalTile(
                          title: '${sc.favorite[index]}', onPressed: () {});
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class ModalTile extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? trailWidget;
  ModalTile({required this.title, required this.onPressed, this.trailWidget});

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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.times,
                      color: kTextColor1,
                    ),
                    onPressed: () {},
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
