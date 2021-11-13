import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Fridge {
  List fridge = [];
}

class SearchByIngTextController extends GetxController {
  late TextEditingController searchText;

  void clearController() {
    searchText.clear();
  }

  @override
  onInit() {
    super.onInit();
    searchText = TextEditingController();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   searchText.dispose();
  // }
}

class SearchByIngController extends GetxController {
  SearchByIngController(this._recipeRepository);
  final RecipeRepository _recipeRepository;

  List<RecipeModel> _recipes = <RecipeModel>[].obs;
  final _totalNumber = 0.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _name = ''.obs;
  final _sort = 'ing_count'.obs;
  final sortItems = {'ing_count': 'Item count', 'name': 'Name', 'star': 'Star'};
  final bool checkVisibility = true; 

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  int get totalNumber => _totalNumber.value;
  String get name => _name.value;
  String get sort => _sort.value;
  bool get lastPage => _lastPage.value;
  List<RecipeModel> get recipes => _recipes.toList();

  final _fridge = Fridge().obs;
  List get fridgeItems => _fridge.value.fridge;

  @override
  onInit() {
    getFridgeItems();
    ever(_fridge, (_) {
      updateFridgeItems(fridgeItems);
      recipeClear();
      changePaginationFilter(0, 15);
    });
    ever(_name, (_) {
      recipeClear();
      changePaginationFilter(0, 15);
    });
    ever(_sort, (_) {
      recipeClear();
      changePaginationFilter(0, 15);
    });
    ever(_paginationFilter, (_) => getAllRecipes(fridgeItems, name, sort));
    changePaginationFilter(0, 15);

    super.onInit();
  }

  void changeName(String input) {
    _name.value = input;
  }

  void clearName() {
    _name.value = '';
  }

  void changeSort(String input) {
    _sort.value = input;
  }

  void addFridge(String input) {
    _fridge.update((val) {
      val!.fridge.add(input);
    });
  }

  void recipeClear() {
    _recipes.clear();
  }

  void remove(int index) {
    _fridge.update((val) {
      val!.fridge.removeAt(index);
    });
  }

  Future<void> getAllRecipes(list, name, sort) async {
    final recipesData = await _recipeRepository.searchByIng(
        list, _paginationFilter.value, name, sort);
    if (recipesData.isEmpty) {
      _lastPage.value = true;
    }

    var data = recipesData['data'];
    _totalNumber.value = recipesData['total_number'];
    _recipes.addAll(data);
  }

  Future<void> getFridgeItems() async {
    final fridgeData = await _recipeRepository.getFridge();
    if (fridgeData.isEmpty) {
      _fridge.update((val) {
        val!.fridge = [];
      });
    }
    _fridge.update((val) {
      val!.fridge = fridgeData;
    });
  }

  Future<void> updateFridgeItems(items) async {
    await _recipeRepository.updateFridge(items);
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
