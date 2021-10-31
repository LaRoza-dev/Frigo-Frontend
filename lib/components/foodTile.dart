import 'package:flutter/material.dart';
import 'package:Frigo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:Frigo/models/recipe.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:Frigo/components/stars.dart';

class FoodTile extends StatelessWidget {
  FoodTile(
      {required this.imageId,
      required this.title,
      this.items: 0,
      this.allItems: 0,
      this.star: 0,
      this.cal: '0',
      this.favorite: false,
      this.onPressed,
      this.width});
  final String imageId;
  final String title;
  final int items;
  final int allItems;
  final int star;
  final String cal;
  final bool favorite;
  final onPressed;
  final width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        child: img.requireData,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
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
                  padding: const EdgeInsets.fromLTRB(0, 15, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(title, style: kText1, maxLines: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.shoppingBasket,
                                            size: 18,
                                            color: kTileItemColor,
                                          ),
                                          Text(' $items / $allItems',
                                              style: TextStyle(
                                                color: kTileItemColor,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins',
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: rating(star),
                                        // children: rating(5),
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
                          ),
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
