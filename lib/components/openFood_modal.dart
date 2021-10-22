import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/models/recipe.dart';

Future<dynamic> openFoodModal(BuildContext context, String id) {
  // SearchController searchController = Get.put(SearchController());

  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
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
                    future: Get.put(DetaImage()).getImage(id),
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> img) {
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
                              color: Colors.white.withOpacity(0.5),
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
          ],
        ),
      ),
    ),
  );
}
