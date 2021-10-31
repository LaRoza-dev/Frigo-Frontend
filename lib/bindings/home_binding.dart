import 'package:get/get.dart';
import 'package:Frigo/models/recipe.dart';
import 'package:Frigo/controllers/recipe_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecipeRepository());
    Get.lazyPut(() => RecipeController(Get.find()));
  }
}
