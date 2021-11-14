import 'package:get/get.dart';
import 'package:Frigo/models/recipe.dart';
import 'package:Frigo/controllers/findAllRecipe_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecipeRepository());
    Get.lazyPut(() => FindAllRecipeController(Get.find<RecipeRepository>()));
    Get.lazyPut(() => FindAllRecipeTextController());
  }
}
