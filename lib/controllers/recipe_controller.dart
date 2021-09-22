import 'dart:convert';

import 'package:fridge/models/user.dart';
import 'package:fridge/models/recipe.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var recipe = Recipe();
  Future<List<dynamic>> search(query) async {
    var result = await recipe.search([query], '1', '5');
    return result;
  }

  extractRecipeDetails(List list) {
    List recipes = [];

    for (int i = 0; i < list.length; i++) {
      var recipe = {};

      var jsonDecoded = list[i];

      recipe['name'] = jsonDecoded['name'];

      recipe['id'] = jsonDecoded['id'];

      recipes.add(recipe);
    }

    return recipes;
  }

  test(query) async {
    var result = await this.search(query);

    var data = extractRecipeDetails(result);

    print(data);
  }
}
