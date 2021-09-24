import 'package:get/get.dart';
import 'package:fridge/models/recipe.dart';
import 'package:fridge/controllers/recipe_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecipeRepository());
    Get.lazyPut(() => RecipeController(Get.find()));
  }
}
