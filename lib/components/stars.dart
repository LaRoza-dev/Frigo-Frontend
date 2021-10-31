import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/constants.dart';

List<Widget> rating(count) {
  List<Widget> wList = [];
  for (var i = 1; i < count + 1; i++) {
    wList.add(
      FaIcon(
        FontAwesomeIcons.solidStar,
        size: 13,
        color: kTileStarColor,
      ),
    );
  }
  for (var i = 1; i < 5 - count + 1; i++) {
    wList.add(
      FaIcon(
        FontAwesomeIcons.star,
        size: 13,
        color: kTileStarColor,
      ),
    );
  }
  return wList;
}
