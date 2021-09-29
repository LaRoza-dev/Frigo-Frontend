import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'buttons.dart';
import 'package:get/get.dart';
import 'package:fridge/models/recipe.dart';

class FoodTile extends StatelessWidget {
  FoodTile(
      {required this.imageId,
      required this.title,
      this.items: 0,
      this.allItems: 0,
      this.star: 0,
      this.cal: '0',
      this.favorite: false});
  final String imageId;
  final String title;
  final int items;
  final int allItems;
  final int star;
  final String cal;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              FutureBuilder(
                future: Get.put(DetaImage()).getImage(imageId),
                builder: (BuildContext context, AsyncSnapshot<Widget> img) {
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
              SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          title,
                          style: kText1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.shoppingBasket,
                                          size: 20,
                                          color: kTileItemColor,
                                        ),
                                        Text(' $items / $allItems',
                                            style: TextStyle(
                                              color: kTileItemColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Poppins',
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.solidStar,
                                          size: 20,
                                          color: kTileStarColor,
                                        ),
                                        Text(' $star',
                                            style: TextStyle(
                                              color: kTileStarColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Poppins',
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Text('Kcal: $cal',
                                    style: TextStyle(
                                      color: kFieldTextColor,
                                      fontFamily: 'Poppins',
                                    ))
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CircleIconButton(
                                color: kButtonColor,
                                onColor: Colors.white,
                                icon: FontAwesomeIcons.heart,
                                size: 15,
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
