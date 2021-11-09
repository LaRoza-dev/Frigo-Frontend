import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FindAllRecipeTextController extends GetxController {
  late TextEditingController searchText;

  void clearController() {
    searchText.clear();
  }

  @override
  onInit() {
    super.onInit();
    searchText = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    searchText.dispose();
  }
}

class FindAllRecipeController extends GetxController {
  FindAllRecipeController(this._recipeRepository);
  final RecipeRepository _recipeRepository;

  List<RecipeModel> _recipes = <RecipeModel>[].obs;
  final _totalNumber = 0.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _name = ''.obs;

  List<RecipeModel> get recipes => _recipes.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  int get totalNumber => _totalNumber.value;
  bool get lastPage => _lastPage.value;
  String get name => _name.value;

  @override
  onInit() {
    ever(_name, (_) => recipeClear());
    ever(_name, (_) => getAllRecipes(name));
    ever(_paginationFilter, (_) => getAllRecipes(name));
    changePaginationFilter(0, 15);
    super.onInit();
  }

  void changeName(String input) {
    _name.value = input;
  }

  void clearName() {
    _name.value = '';
  }

  void recipeClear() {
    _recipes.clear();
  }

  Future<void> getAllRecipes(name) async {
    final recipesData =
        await _recipeRepository.getRecipes(_paginationFilter.value,name);
    if (recipesData.isEmpty) {
      _lastPage.value = true;
    }

    var data = recipesData['data'];
    _totalNumber.value = recipesData['total_number'];
    _recipes.addAll(data);
  }

  void changeTotalPerPage(int limitValue) {
    _recipes.clear();
    _lastPage.value = false;
    changePaginationFilter(0, limitValue);
  }

  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => changePaginationFilter(_page + 1, limit);
}
