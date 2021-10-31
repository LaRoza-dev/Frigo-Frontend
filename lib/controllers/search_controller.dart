import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Search {
  Search({this.text=''});
  String text;
}

class SearchController extends GetxController {
  final name = Search().obs;

  updateName(String input) {
    name.update((val) {
        val!.text = input;
      });
  }

  late TextEditingController searchText;
  @override
  void onInit() {
    super.onInit();
    searchText = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    searchText.dispose();
  }
}
