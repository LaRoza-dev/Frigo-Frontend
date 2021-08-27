import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  List<String> test = [
    'aa',
    'a',
    'b',
    'bb',
    'testtest',
    'roshan',
    'flutter',
    'london',
    'united kingdom',
    'food1',
    'ghorme sabzi',
  ].obs;

  List favorite = [].obs;

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
