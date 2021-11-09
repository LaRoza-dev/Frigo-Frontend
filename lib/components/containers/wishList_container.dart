import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Frigo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Frigo/controllers/wishList_controller.dart';
import 'package:get/get.dart';
import 'package:Frigo/controllers/pageContents_controller.dart';
import 'package:Frigo/models/recipe.dart';

class WishlistContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WishlistController _controller =
        Get.put(WishlistController(Get.find<RecipeRepository>()));
    final PageContentsController contentsController =
        Get.put(PageContentsController());
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(shrinkWrap: true, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _controller.wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = _controller.wishlistItems[index];
                      return ModalTile(
                        title: item,
                        onPressed: () {},
                        crossOnPressed: () {
                          _controller.remove(index);
                        },
                        heartOnPressed: () {},
                      );
                    },
                  ),
                ),
              )
            ]),
          ),
          
        ],
      ),
    );
  }
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
