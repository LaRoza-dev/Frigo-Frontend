import 'package:flutter/material.dart';

class PageContents {
  PageContents(
      {this.title = 'All Foods',
      this.container,
      this.textField,
      this.searchbarVisibility = true,
      this.findType = 'all',
      this.itemsVisibility = false});
  String findType;
  String title;
  Widget? container;
  Widget? textField;
  bool searchbarVisibility;
  bool itemsVisibility;
}
