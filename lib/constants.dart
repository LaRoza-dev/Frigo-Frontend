import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage kStorage = GetStorage();

const kButtonColor = Color(0xFF572D86);
// const kPrimaryColor = Color.fromRGBO(160, 77, 255, 1);
const kPrimaryColor = Color.fromRGBO(128, 0, 200, 1);
const kPrimaryColor2 = Color.fromRGBO(73, 26, 100, 1);

const kBackgroundColor = Color.fromRGBO(246, 249, 250, 1);
const kTextColor1 = Color.fromRGBO(13, 24, 99, 1);
const ktext2Color = Color.fromRGBO(53, 76, 123, 1);
const kTextColor2 = Colors.white;
// const kFieldTextColor = Color.fromRGBO(204, 205, 223, 1);
const kFieldTextColor = Colors.grey;

const kTileColor = Color.fromRGBO(146, 163, 197, 1);
// const kTileColor = Color.fromRGBO(146, 163, 197, 0.1);

const kRedColor = Color.fromRGBO(238, 49, 105, 1);

// const kTileItemColor = Color.fromRGBO(195, 214, 27, 1);
const kTileItemColor = Colors.lightGreen;
const kTileStarColor = Color.fromRGBO(255, 179, 0, 1);
const kBorderColor = Color.fromRGBO(231, 231, 239, 1);

final kHeading1 = TextStyle(
  color: kTextColor1,
  fontSize: ScreenUtil().scaleText * 29.0,
  fontWeight: FontWeight.w500,
  // fontFamily: 'Poppins'
);

final kHeading2 = TextStyle(
  color: kTextColor1,
  fontSize: ScreenUtil().scaleText * 25.0,
  fontWeight: FontWeight.w500,
  // fontFamily: 'Poppins'
);

final kHeading3 = TextStyle(
  color: kTextColor1,
  fontSize: ScreenUtil().scaleText * 23.0,
  fontWeight: FontWeight.w500,
  // fontFamily: 'Poppins'
);

final kText1 = TextStyle(
  color: kTextColor1,
  fontSize: ScreenUtil().scaleText * 21.0,
  fontWeight: FontWeight.w500,
  // fontFamily: 'Poppins',
);

final ktext2 = TextStyle(
  color: Color.fromRGBO(53, 76, 123, 1),
  fontSize: ScreenUtil().scaleText * 17.0,
  fontWeight: FontWeight.w300,
  // fontFamily: 'Poppins'
);

final kFormField = TextStyle(
  color: kFieldTextColor,
  fontSize: ScreenUtil().scaleText * 15.0,
  fontWeight: FontWeight.w300,
  // fontFamily: 'Poppins'
);

final kNutrition =
    TextStyle(color: kFieldTextColor, fontSize: ScreenUtil().scaleText * 17
        // fontFamily: 'Poppins',
        );
