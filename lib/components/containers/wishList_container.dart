import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:fridge/controllers/search_controller.dart';

class WishListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SearchController searchController = Get.put(SearchController());
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wish List',
                    style: kHeading2,
                  ),
                ]),
          ),
          Padding(
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
            ),
          ),

          // ListView(shrinkWrap: true, children: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
          //     child:
          // () => ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: searchController.basket.length,
          //   itemBuilder: (context, index) {
          //     return ModalTile(
          //       title: '${searchController.basket[index]}',
          //       onPressed: () {},
          //       crossOnPressed: () {
          //         searchController.basket.removeAt(index);
          //       },
          //       heartOnPressed: () {},
          //     );
          //   },
          // ),
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
