import 'package:Frigo/controllers/findAllRecipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:Frigo/controllers/pageContents_controller.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Frigo/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:Frigo/components/containers/allFoods_container.dart';
import 'package:Frigo/components/foodSearchField.dart';

class HomePage extends StatelessWidget {
  final PageContentsController contentsController =
      Get.put(PageContentsController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
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
          contentsController.updateContents(index);
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Obx(
                      () => Text(
                        '${contentsController.pageContents.value.title}',
                        style: kHeading2.copyWith(
                            fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Obx(
                    () => Visibility(
                      visible: contentsController
                          .pageContents.value.searchbarVisibility,
                      child: contentsController.pageContents.value.textField ??
                          FoodSearchField(
                            controller: Get.find<FindAllRecipeController>(),
                            textController:
                                Get.find<FindAllRecipeTextController>(),
                            width: width,
                            text: "Search here",
                          ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Obx(() {
                    return contentsController.pageContents.value.container ??
                        AllFoodsContainer();
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
