import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  final RecipeRepository _recipeRepository;
  final _recipes = <RecipeModel>[].obs;
  final _total_number = 0.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  RecipeController(this._recipeRepository);

  List<RecipeModel> get recipes => _recipes.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  @override
  onInit() {
    ever(_paginationFilter, (_) => _getAllRecipes());
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> _getAllRecipes() async {
    final recipesData =
        await _recipeRepository.getRecipes(_paginationFilter.value);
    if (recipesData.isEmpty) {
      _lastPage.value = true;
    }

    var data = recipesData['data'];
    _recipes.addAll(data);
  }

  Future<int> getTotalNumber() async {
    final totalNumber =
        await _recipeRepository.getRecipes(_paginationFilter.value);

    _total_number.value = totalNumber['total_number'];
    return totalNumber['total_number'];
  }

  void changeTotalPerPage(int limitValue) {
    _recipes.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
}
