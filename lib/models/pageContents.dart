import 'package:flutter/material.dart';

class PageContents {
  PageContents({this.title = 'All Foods',this.container,this.visibility=true,this.findType = 'all'});
  String findType;
  String title;
  Widget? container;
  bool? visibility;
}
