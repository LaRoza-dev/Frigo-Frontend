import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  final RecipeRepository _recipeRepository;
  List<RecipeModel> _recipes = <RecipeModel>[].obs;
  final _totalNumber = 0.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _condition = GetCondition().obs;

  RecipeController(this._recipeRepository);

  List<RecipeModel> get recipes => _recipes.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  String get condition => _condition.value.c;

  @override
  onInit() {
    ever(_paginationFilter, (_) => getAllRecipes(condition));
    changePaginationFilter(0, 10);
    super.onInit();
  }

  updateCondition(String input) {
    _condition.update((val) {
      val!.c = input;
    });
  }

  resetRecipe() {
    // _recipes = <RecipeModel>[].obs;
    _recipes.clear();
    // _lastPage.value = true;
  }

  // Future<void> getAllRecipes(condition) async {
  Future<List> getAllRecipes(condition) async {

    if (condition == 'all') {
      // reseter();

      final recipesData =
          await _recipeRepository.getRecipes(_paginationFilter.value);
      if (recipesData.isEmpty) {
        _lastPage.value = true;
      }

      var data = recipesData['data'];
      _recipes.addAll(data);
      return _recipes;
    } else if (condition == 'searchByIng') {
      final recipesData = await _recipeRepository.searchByIng(
          '["avocado"]', _paginationFilter.value);
      if (recipesData.isEmpty) {
        _lastPage.value = true;
      }

      var data = recipesData['data'];
      _recipes.addAll(data);
      return _recipes;
    }
    else {
    return [];
    }
  }

  Future<int> getTotalNumber() async {
    if (condition == 'all') {
      final totalNumber =
          await _recipeRepository.getRecipes(_paginationFilter.value);
      _totalNumber.value = totalNumber['total_number'];

      return totalNumber['total_number'];
    } else if (condition == 'searchByIng') {
      final totalNumber = await _recipeRepository.searchByIng(
          '["bread","cheese"]', _paginationFilter.value);

      _totalNumber.value = totalNumber['total_number'];

      return totalNumber['total_number'];
    } else {
      return 0;
    }
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

  // void loadNextPage() => changePaginationFilter(_page + 1, limit);

  void loadNextPage() {
    print(_page);
    return changePaginationFilter(_page + 1, limit);
  }
}
