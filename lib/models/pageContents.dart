import 'package:flutter/material.dart';

class PageContents {
  PageContents({this.title = 'All Foods',this.container,this.visibility=true,this.condition = 'all'});
  String condition;
  String title;
  Widget? container;
  bool? visibility;
}
