import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Frigo/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> rating(count) {
  List<Widget> wList = [];
  for (var i = 1; i < count + 1; i++) {
    wList.add(
      FaIcon(
        FontAwesomeIcons.solidStar,
        size: ScreenUtil().scaleText * 15,
        color: kTileStarColor,
      ),
    );
  }
  for (var i = 1; i < 5 - count + 1; i++) {
    wList.add(
      FaIcon(
        FontAwesomeIcons.star,
        size: ScreenUtil().scaleText * 15,
        color: kTileStarColor,
      ),
    );
  }
  return wList;
}
