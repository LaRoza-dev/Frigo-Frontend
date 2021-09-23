import 'package:fridge/models/recipe.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var recipe = Recipe();
  Future<List> searchByIng(query) async {
    var result = await recipe.search([query], '1', '10');
    return result;
  }

  Future<List> getAll() async {
    var result = await recipe.getAll('1', '10');
    return result;
  }
}
