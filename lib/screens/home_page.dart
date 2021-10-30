import 'package:flutter/material.dart';
import 'package:fridge/controllers/pageContents_controller.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fridge/components/containers/foods_container.dart';

class HomePage extends StatelessWidget {
  final PageContentsController contentsController =
      Get.put(PageContentsController());
  @override
  Widget build(BuildContext context) {
    // print(contentsController.pageContents.value.container.runtimeType);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: CurvedNavigationBar(animationDuration: Duration(milliseconds: 300),
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
          // print(contentsController.pageContents.value.title);
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
                    padding: const EdgeInsets.only(top: 10),
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Obx(
                    () => Visibility(
                      visible: contentsController.pageContents.value.visibility??false,
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
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Obx(() {
                    return contentsController.pageContents.value.container ??
                        FoodsContainer();
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
