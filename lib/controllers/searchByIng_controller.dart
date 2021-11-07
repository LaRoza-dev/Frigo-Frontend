import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';

class SearchByIngController extends GetxController {
  final RecipeRepository _recipeRepository;
  List<RecipeModel> _recipes = <RecipeModel>[].obs;
  List<String> _fridgeItems = [''].obs;
  final _totalNumber = 0.obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  SearchByIngController(this._recipeRepository);

  List<RecipeModel> get recipes => _recipes.toList();
  List<String> get fridgeItems => _fridgeItems.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
   int get totalNumber => _totalNumber.value;
  bool get lastPage => _lastPage.value;

  @override
  onInit() {
    ever(_paginationFilter, (_) => getAllRecipes(fridgeItems));
    changePaginationFilter(0, 15);
    super.onInit();
  }


  Future<void> getAllRecipes(list) async {
    final recipesData =
        await _recipeRepository.searchByIng(list,_paginationFilter.value);
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
