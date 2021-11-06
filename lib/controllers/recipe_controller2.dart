import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';

class RecipeController2 extends GetxController {
  final RecipeRepository _recipeRepository;
  List<RecipeModel> _recipes = <RecipeModel>[].obs;
  final _totalNumber = 0.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  RecipeController2(this._recipeRepository);

  List<RecipeModel> get recipes => _recipes.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  @override
  onInit() {
    ever(_paginationFilter, (_) => getAllRecipes());
    changePaginationFilter(0, 7);
    super.onInit();
  }


  Future<void> getAllRecipes() async {
    final recipesData =
        await _recipeRepository.searchByIng('["avocado"]',_paginationFilter.value);
    if (recipesData.isEmpty) {
      _lastPage.value = true;
    }

    var data = recipesData['data'];
    _recipes.addAll(data);
  }

  Future<int> getTotalNumber() async {
    final totalNumber =
        await _recipeRepository.searchByIng('["avocado"]',_paginationFilter.value);
    _totalNumber.value = totalNumber['total_number'];
    print(_totalNumber.value);
    return totalNumber['total_number'];
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
